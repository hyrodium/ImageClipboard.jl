function _isavailable_xclip()
    return success(pipeline(`which xclip`))
end

"""
    _xclip() -> AbstractMatrix{<:Colorant}

Paste an image from clipboard using `xclip`
"""
function _xclip()
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
    _xclip(img::AbstractMatrix{<:Colorant})

Copy an image to clipboard using `xclip`
"""
function _xclip(img::AbstractMatrix{<:Colorant})
    img_buf = IOBuffer()

    # Save given image to buffer
    save(Stream{format"PNG"}(img_buf), img)

    # Copy to clipboard
    open(`xclip -selection clipboard -t image/png`, "w", stdout) do f
        print(f, String(take!(img_buf)))
    end
end
