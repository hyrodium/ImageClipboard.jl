# ImageClipboard.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://hyrodium.github.io/ImageClipboard.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hyrodium.github.io/ImageClipboard.jl/dev)
[![Build Status](https://github.com/hyrodium/ImageClipboard.jl/workflows/CI/badge.svg)](https://github.com/hyrodium/ImageClipboard.jl/actions)
[![Coverage](https://codecov.io/gh/hyrodium/ImageClipboard.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/hyrodium/ImageClipboard.jl)

Copy & Paste images with Julia

## Install
```
pkg> add ImageClipboard
```

## Usage
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

https://github.com/user-attachments/assets/0daf9e19-42ad-447f-9600-2350627200de

### Julia Compatibility
For Julia versions older than `v"1.3"`, you need to manually install the image IO backend [ImageMagick.jl](https://github.com/JuliaIO/ImageMagick.jl) first.

### Other related packages
* [ClipData.jl](https://github.com/pdeffebach/ClipData.jl) enables users to copy/paste to/from Excel, Google Sheets, and other tabular data sources into interactive Julia sessions.
