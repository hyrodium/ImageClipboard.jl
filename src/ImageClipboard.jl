module ImageClipboard

using ImageIO, FileIO, ColorTypes

export clipboard_img

# linux
include("_xclip.jl")
# # mac
# include("_osascript.jl")
# # windows
include("_powershell.jl")


"""
    clipboard_img() -> Matrix{<:Colorant}

Paste an image from clipboard
"""
function clipboard_img()
    if Sys.islinux()
        img = _xclip()
    elseif Sys.iswindows()
        img = _powershell()
    else
        error("Currently, only linux and windows are supported")
    end
    return img
end

"""
    clipboard_img(img::Matrix{<:Colorant})

Copy an image to clipboard
"""
function clipboard_img(img::Matrix{<:Colorant})
    if Sys.islinux()
        _xclip(img)
    elseif Sys.iswindows()
        _powershell(img)
    else
        error("Currently, only linux and windows are supported")
    end
    nothing
end

end # module
