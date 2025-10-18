"""
    _powershell() -> AbstractMatrix{<:Colorant}

Paste an image from clipboard using `powershell` (supports RGBA)
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

Copy an image to clipboard using `powershell` (supports RGBA)
"""
function _powershell(img::AbstractMatrix{<:Colorant})
    mktempdir() do dir
        # Define path
        filename = "clipboard.png"
        filepath = joinpath(dir, filename)

        # Save image as PNG
        save(filepath, img)

        # Compose command & run
        script = """
        Add-Type -AssemblyName System.Windows.Forms;
        Add-Type -AssemblyName System.Drawing;

        # Load image
        \$img = [System.Drawing.Image]::FromFile("$(filepath)");

        # Create MemoryStream with PNG data (preserves transparency)
        \$ms = New-Object System.IO.MemoryStream;
        \$img.Save(\$ms, [System.Drawing.Imaging.ImageFormat]::Png);
        \$ms.Position = 0;

        # Create DataObject and set both formats
        \$dataObject = New-Object System.Windows.Forms.DataObject;

        # Set PNG format (for modern apps with RGBA support)
        \$dataObject.SetData("PNG", \$false, \$ms);

        # Set standard image format (for compatibility with legacy apps)
        \$img2 = [System.Drawing.Image]::FromFile("$(filepath)");
        \$dataObject.SetImage(\$img2);

        # Copy to clipboard with persistence
        [System.Windows.Forms.Clipboard]::SetDataObject(\$dataObject, \$true);

        # Cleanup
        \$img.Dispose();
        \$img2.Dispose();
        \$ms.Close();
        """
        cmd = `powershell.exe -NoProfile -Command $script`
        run(cmd)
    end
end