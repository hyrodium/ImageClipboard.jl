"""
Get image from clipboard using xclip
"""
function xclip_paste()
    mktempdir() do dir
        path_png = joinpath(dir, "clipboard.png")
        run(pipeline(`xclip -selection clipboard -t image/png -o`, stdout=path_png))
        img = load(path_png)
        return img
    end
end
