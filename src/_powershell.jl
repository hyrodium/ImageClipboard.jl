"""
    _powershell() -> AbstractMatrix{<:Colorant}

Paste an image from clipboard using `powershell`
"""
function _powershell()
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Compose command & run (try to get PNG format first for RGBA support)
        script = """
        Add-Type -AssemblyName System.Windows.Forms;
        \$png = [System.Windows.Forms.Clipboard]::GetData("PNG");
        if (\$png -ne \$null) {
            # PNG format available (preserves transparency)
            \$ms = \$png;
            \$fs = [System.IO.File]::OpenWrite("$(path_png)");
            \$ms.CopyTo(\$fs);
            \$fs.Close();
            \$ms.Close();
        } else {
            # Fallback to standard image format
            \$img = [Windows.Forms.Clipboard]::GetImage();
            if (\$img -ne \$null) {
                \$img.Save("$(path_png)", [System.Drawing.Imaging.ImageFormat]::Png);
                \$img.Dispose();
            }
        }
        """
        cmd = `powershell.exe -NoProfile -Command $script`
        run(cmd)

        # Paste from clipboard
        if isfile(path_png)
            img = load(path_png)
            return img
        else
            error("No image in clipboard")
        end
    end
end

"""
    _powershell(img::AbstractMatrix{<:Colorant})

Copy an image to clipboard using `powershell`
"""
function _powershell(img::AbstractMatrix{<:Colorant})
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")
        save(path_png, img)

        # Use a more complex script that handles RGBA properly
        script = """
        Add-Type -AssemblyName System.Windows.Forms;
        Add-Type -AssemblyName System.Drawing;

        # Load image
        \$bmp = New-Object System.Drawing.Bitmap("$(path_png)");

        # Read PNG bytes
        \$pngBytes = [System.IO.File]::ReadAllBytes("$(path_png)");
        \$pngStream = New-Object System.IO.MemoryStream(,\$pngBytes);

        # Create DataObject
        \$dataObject = New-Object System.Windows.Forms.DataObject;

        # Set PNG
        \$dataObject.SetData("PNG", \$false, \$pngStream);

        # Set bitmap with alpha (convert to Format32bppArgb if needed)
        if (\$bmp.PixelFormat -ne [System.Drawing.Imaging.PixelFormat]::Format32bppArgb) {
            \$bmpArgb = New-Object System.Drawing.Bitmap(\$bmp.Width, \$bmp.Height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb);
            \$graphics = [System.Drawing.Graphics]::FromImage(\$bmpArgb);
            \$graphics.DrawImage(\$bmp, 0, 0);
            \$graphics.Dispose();
            \$bmp.Dispose();
            \$bmp = \$bmpArgb;
        }

        \$dataObject.SetImage(\$bmp);

        # Clear and set
        [System.Windows.Forms.Clipboard]::Clear();
        [System.Windows.Forms.Clipboard]::SetDataObject(\$dataObject, \$true);

        Start-Sleep -Milliseconds 100;

        \$pngStream.Close();
        \$bmp.Dispose();
        """
        cmd = `powershell.exe -NoProfile -Command $script`
        run(cmd)
    end
end
