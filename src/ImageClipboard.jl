module ImageClipboard

using ImageIO, FileIO, ColorTypes

export clipboard_img

# linux-X11
include("_xclip.jl")
# linux-wayland
include("_wlclipboard.jl")
# mac
# include("_osascript.jl")
# windows
include("_powershell.jl")

"""
    clipboard_img() -> Matrix{<:Colorant}

Paste an image from clipboard
"""
function clipboard_img()
    if Sys.islinux()
        if get(ENV, "XDG_SESSION_TYPE", "") == "wayland" && _isavailable_wlclipboard()
            img = _wlclipboard()
        else
            img = _xclip()
        end
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
        if get(ENV, "XDG_SESSION_TYPE", "") == "wayland" && _isavailable_wlclipboard()
            _wlclipboard(img)
        else
            _xclip(img)
        end
    elseif Sys.iswindows()
        _powershell(img)
    else
        error("Currently, only linux and windows are supported")
    end
    return nothing
end

end # module
