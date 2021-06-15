"""
    _osascript() -> Matrix{<:Colorant}

Paste an image from clipboard using `osascript`
"""
function _osascript()
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Compose command & run
        cmd = Cmd(["osascript", "-e", "try\nwrite (the clipboard as «class PNGf») to (open for access \"$(path_png)\" with write permission)\nend try"])
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
    _osascript(img::Matrix{<:Colorant})

Copy an image to clipboard using `osascript`
"""
function _osascript(img::Matrix{<:Colorant})
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Save image
        save(path_png, img)

        # Compose command & run
        cmd = Cmd(["osascript", "-e", "set the clipboard to (read \"$(path_png)\" as «class PNGf»)"])
        run(cmd)
    end
end
