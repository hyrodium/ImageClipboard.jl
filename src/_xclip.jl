"""
Get an image from clipboard using xclip
"""
function xclip_paste()
    mktempdir() do dir
        path_png = joinpath(dir, "clipboard.png")
        run(pipeline(`xclip -selection clipboard -t image/png -o`, stdout=path_png))
        img = load(path_png)
        return img
    end
end

"""
Copy an image to clipboard using xclip
"""
function xclip_copy(img::Matrix{<:Colorant})
    mktempdir() do dir
        path_png = joinpath(dir, "clipboard.png")
        save(path_png, img)
        run(pipeline(`xclip -selection clipboard -t image/png -i $(path_png)`))
    end
end
