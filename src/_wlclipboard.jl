function _isavailable_wlclipboard()
    return success(pipeline(`which wl-copy`))
end

"""
Paste an image from clipboard using wl-paste
"""
function _wlclipboard()
    img_buf = IOBuffer()

    # Pipe clipboard image to buffer
    if success(pipeline(`wl-paste -t image/png`; stdout=img_buf))
        # Load image from buffer
        img = load(img_buf)
        return img
    else
        error("No image in clipboard")
    end
end

"""
Copy an image to clipboard using wl-copy
"""
function _wlclipboard(img::Matrix{<:Colorant})
    img_buf = IOBuffer()

    # Save given image to buffer
    save(Stream{format"PNG"}(img_buf), img)

    # Copy to clipboard
    open(`wl-copy -t image/png`, "w", stdout) do f
        print(f, String(take!(img_buf)))
    end
end
