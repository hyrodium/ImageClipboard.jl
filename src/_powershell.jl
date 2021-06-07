"""
    _powershell() -> Matrix{<:Colorant}

Paste an image from clipboard using powershell
"""
function _powershell()
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Compose command & run
        addtype = `Add-Type -AssemblyName System.Windows.Forms\;`
        getimg = `\$img=\[Windows.Forms.Clipboard\]::GetImage\(\)\;`
        saveimg = `if \(\$img -ne \$null\)\{\$img.Save\(\"$(path_png)\"\)\}`
        cmd = `powershell $addtype $getimg $saveimg`
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
    _powershell(img::Matrix{<:Colorant})

Copy an image to clipboard using powershell
"""
function _powershell(img::Matrix{<:Colorant})
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Save image
        save(path_png, img)

        # Compose command & run
        addtype = `Add-Type -AssemblyName System.Windows.Forms\;`
        adddrawing = `\[Reflection.Assembly\]::LoadWithPartialName\(\'System.Drawing\'\)\;`
        getfile = `\$file = get-item\(\"$(path_png)\"\)\;`
        getimg = `\$img = \[System.Drawing.Image\]::Fromfile\(\$file\)\;`
        copyimg = `\[System.Windows.Forms.Clipboard\]::SetImage\(\$img\)\;`
        cmd = `powershell $addtype $adddrawing $getfile $getimg $copyimg`
        run(cmd)
    end
end
