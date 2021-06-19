```@meta
CurrentModule = ImageClipboard
```

# ImageClipboard

Copy & Paste images with Julia

## Install
```
pkg> add ImageClipboard
```

## Basic usage
Just like `clipboard` in InteractiveUtils deals with string contents, this package provides `clipboard_img` to work with image contents:

```julia
using Images, ImageClipboard

# Create a random image
img = rand(RGB{N0f8}, 100, 200)

# Copy the image to the clipboard
clipboard_img(img)

# Paste the image from the clipboard
img2 = clipboard_img()

# These are the same images
img == img2  # true
```

## Sample screenshots
### Copy an image
![](img/screenshot_copy.gif)

### Paste an image
![](img/screenshot_paste.gif)

### Julia Compatibility
For Julia versions older than `v"1.3"`, you need to manually install the image IO backend [ImageMagick.jl](https://github.com/JuliaIO/ImageMagick.jl) first.

### Other related packages
* [ClipData.jl](https://pdeffebach.github.io/ClipData.jl/dev/) enables users to copy/paste to/from Excel, Google Sheets, and other tabular data sources into interactive Julia sessions.
