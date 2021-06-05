"""
Paste an image from clipboard using xclip
"""
function _xclip()
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Save clipboard image
        run(pipeline(`xclip -selection clipboard -t image/png -o`, stdout=path_png))

        # Load image
        img = load(path_png)
        return img
    end
end


"""
Copy an image to clipboard using xclip
"""
function _xclip(img::Matrix{<:Colorant})
    mktempdir() do dir
        # Define path
        path_png = joinpath(dir, "clipboard.png")

        # Save given image
        save(path_png, img)

        # Copy to clipboard
        run(pipeline(`xclip -selection clipboard -t image/png -i $(path_png)`))
    end
end
