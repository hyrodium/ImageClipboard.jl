"""
    _powershell() -> AbstractMatrix{<:Colorant}

Paste an image from clipboard using `powershell`
"""
function _powershell()
    mktempdir() do dir
        # Define paths
        filename = "clipboard.png"
        path_png = joinpath(dir, filename)

        # Compose command & run (try to get PNG format first for RGBA support)
        script = """
        Add-Type -AssemblyName System.Windows.Forms;
        \$png = [System.Windows.Forms.Clipboard]::GetData("PNG");
        if (\$png -ne \$null) {
            # PNG format available (preserves transparency)
            \$ms = \$png;
            \$fs = [System.IO.File]::OpenWrite("$filename");
            \$ms.CopyTo(\$fs);
            \$fs.Close();
            \$ms.Close();
        } else {
            # Fallback to standard image format
            \$img = [Windows.Forms.Clipboard]::GetImage();
            if (\$img -ne \$null) {
                \$img.Save("$filename", [System.Drawing.Imaging.ImageFormat]::Png);
                \$img.Dispose();
            }
        }
        """

        # Use `dir` kwarg for WSL support
        cmd = Cmd(`powershell.exe -NoProfile -Command $script`; dir)
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
        # Define paths
        filename = "clipboard.png"
        path_png = joinpath(dir, filename)

        # Save temporary PNG file
        save(path_png, img)

        # Use a more complex script that handles RGBA properly
        script = """
        Add-Type -AssemblyName System.Windows.Forms;
        Add-Type -AssemblyName System.Drawing;

        # Load image
        \$bmp = New-Object System.Drawing.Bitmap("$filename");

        # Read PNG bytes
        \$pngBytes = [System.IO.File]::ReadAllBytes("$filename");
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

        # Use `dir` kwarg for WSL support
        cmd = Cmd(`powershell.exe -NoProfile -Command $script`; dir)
        run(cmd)
    end
end
