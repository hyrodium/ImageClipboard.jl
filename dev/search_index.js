var documenterSearchIndex = {"docs":
[{"location":"functionreference/","page":"Function Reference","title":"Function Reference","text":"CurrentModule = ImageClipboard","category":"page"},{"location":"functionreference/#Function-reference","page":"Function Reference","title":"Function reference","text":"","category":"section"},{"location":"functionreference/#Index","page":"Function Reference","title":"Index","text":"","category":"section"},{"location":"functionreference/","page":"Function Reference","title":"Function Reference","text":"","category":"page"},{"location":"functionreference/#Public-methods","page":"Function Reference","title":"Public methods","text":"","category":"section"},{"location":"functionreference/","page":"Function Reference","title":"Function Reference","text":"clipboard_img()","category":"page"},{"location":"functionreference/#ImageClipboard.clipboard_img-Tuple{}","page":"Function Reference","title":"ImageClipboard.clipboard_img","text":"clipboard_img() -> AbstractMatrix{<:Colorant}\n\nPaste an image from clipboard\n\n\n\n\n\n","category":"method"},{"location":"functionreference/","page":"Function Reference","title":"Function Reference","text":"clipboard_img(::AbstractMatrix{<:Colorant})","category":"page"},{"location":"functionreference/#ImageClipboard.clipboard_img-Tuple{AbstractMatrix{var\"#s1\"} where var\"#s1\"<:ColorTypes.Colorant}","page":"Function Reference","title":"ImageClipboard.clipboard_img","text":"clipboard_img(img::AbstractMatrix{<:Colorant})\n\nCopy an image to clipboard\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#Private-methods","page":"Function Reference","title":"Private methods","text":"","category":"section"},{"location":"functionreference/","page":"Function Reference","title":"Function Reference","text":"Modules = [ImageClipboard]\nPrivate = true\nPublic = false","category":"page"},{"location":"functionreference/#ImageClipboard._osascript-Tuple{AbstractMatrix{var\"#s1\"} where var\"#s1\"<:ColorTypes.Colorant}","page":"Function Reference","title":"ImageClipboard._osascript","text":"_osascript(img::AbstractMatrix{<:Colorant})\n\nCopy an image to clipboard using osascript\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._osascript-Tuple{}","page":"Function Reference","title":"ImageClipboard._osascript","text":"_osascript() -> AbstractMatrix{<:Colorant}\n\nPaste an image from clipboard using osascript\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._powershell-Tuple{AbstractMatrix{var\"#s1\"} where var\"#s1\"<:ColorTypes.Colorant}","page":"Function Reference","title":"ImageClipboard._powershell","text":"_powershell(img::AbstractMatrix{<:Colorant})\n\nCopy an image to clipboard using powershell\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._powershell-Tuple{}","page":"Function Reference","title":"ImageClipboard._powershell","text":"_powershell() -> AbstractMatrix{<:Colorant}\n\nPaste an image from clipboard using powershell\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._wlclipboard-Tuple{AbstractMatrix{var\"#s1\"} where var\"#s1\"<:ColorTypes.Colorant}","page":"Function Reference","title":"ImageClipboard._wlclipboard","text":"_wlclipboard(img::AbstractMatrix{<:Colorant})\n\nCopy an image to clipboard using wl-copy\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._wlclipboard-Tuple{}","page":"Function Reference","title":"ImageClipboard._wlclipboard","text":"_wlclipboard() -> AbstractMatrix{<:Colorant}\n\nPaste an image from clipboard using wl-paste\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._xclip-Tuple{AbstractMatrix{var\"#s2\"} where var\"#s2\"<:ColorTypes.Colorant}","page":"Function Reference","title":"ImageClipboard._xclip","text":"_xclip(img::AbstractMatrix{<:Colorant})\n\nCopy an image to clipboard using xclip\n\n\n\n\n\n","category":"method"},{"location":"functionreference/#ImageClipboard._xclip-Tuple{}","page":"Function Reference","title":"ImageClipboard._xclip","text":"_xclip() -> AbstractMatrix{<:Colorant}\n\nPaste an image from clipboard using xclip\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = ImageClipboard","category":"page"},{"location":"#ImageClipboard","page":"Home","title":"ImageClipboard","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Copy & Paste images with Julia","category":"page"},{"location":"#Install","page":"Home","title":"Install","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"pkg> add ImageClipboard","category":"page"},{"location":"#Basic-usage","page":"Home","title":"Basic usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using Images, ImageClipboard\n\n# Create random image\nimg = rand(RGB{N0f8}, 100, 200)\n\n# Copy to clipboard\nclipboard_img(img)\n\n# Paste image from clipboard\nimg2 = clipboard_img()\n\n# These are the same images\nimg == img2","category":"page"},{"location":"#Sample-screenshots","page":"Home","title":"Sample screenshots","text":"","category":"section"},{"location":"#Copy-an-image","page":"Home","title":"Copy an image","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(Image: )","category":"page"},{"location":"#Paste-an-image","page":"Home","title":"Paste an image","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(Image: )","category":"page"}]
}
