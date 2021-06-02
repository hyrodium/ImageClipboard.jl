module ImageClipboard

using Images

export clipboard_img

# linux
include("_xclip.jl")
# # mac
# include("_osascript.jl")
# # windows
# include("_powershell.jl")


"""
Get an image from clipboard
"""
function clipboard_img()
    if Sys.islinux()
        img = xclip_paste()
    else
        error("Currently, only linux is supported")
    end
    return img
end

"""
Copy an image to clipboard
"""
function clipboard_img(img::Matrix{<:Colorant})
    if Sys.islinux()
        xclip_copy(img)
    else
        error("Currently, only linux is supported")
    end
    nothing
end

end # module
