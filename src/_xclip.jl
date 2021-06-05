function _isavailable_xclip()
    if !success(pipeline(`which xclip`))
        error("Please install xclip to your system")
    end
end


"""
Paste an image from clipboard using xclip
"""
function _xclip()
    _isavailable_xclip()
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Save clipboard image
        if success(pipeline(`xclip -selection clipboard -t image/png -o`, stdout=path_png))
            # Load image
            img = load(path_png)
            return img
        else
            error("No image in clipboard")
        end
    end
end


"""
Copy an image to clipboard using xclip
"""
function _xclip(img::Matrix{<:Colorant})
    _isavailable_xclip()
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Save given image
        save(path_png, img)

        # Copy to clipboard
        run(pipeline(`xclip -selection clipboard -t image/png -i $(path_png)`))
    end
end
