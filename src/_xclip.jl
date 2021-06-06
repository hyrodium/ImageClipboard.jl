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
    img_buf = IOBuffer()

    # Pipe clipboard image to buffer
    if success(pipeline(`xclip -selection clipboard -t image/png -o`; stdout=img_buf))
        # Load image from buffer
        img = load(img_buf)
        return img
    else
        error("No image in clipboard")
    end
end

"""
Copy an image to clipboard using xclip
"""
function _xclip(img::Matrix{<:Colorant})
    _isavailable_xclip()
    img_buf = IOBuffer()

    # Save given image to buffer
    save(Stream{format"PNG"}(img_buf), img)

    # Copy to clipboard
    open(`xclip -selection clipboard -t image/png`, "w", stdout) do f
        print(f, String(take!(img_buf)))
    end
end
