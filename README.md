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
Just like `InteractiveUtils.clipboard` deals with string contents, this package provides `clipboard_img` function to work with image contents:

```julia
using ImageClipboard  # Exports `clipboard_img`
using Images, TestImages

testimage("mandrill")

# Paste image with ImageClipboard.jl🎉🎉🎉
clipboard_img()

# Copy image with ImageClipboard.jl🎉🎉🎉
clipboard_img(Gray.(testimage("mandrill")))
```

https://github.com/user-attachments/assets/8407d4e8-31a4-4108-8ecb-e8481a4f9179

### Julia Compatibility
For Julia versions older than `v"1.3"`, you need to manually install the image IO backend [ImageMagick.jl](https://github.com/JuliaIO/ImageMagick.jl) first.

### Other related packages
* [ClipData.jl](https://github.com/pdeffebach/ClipData.jl) enables users to copy/paste to/from Excel, Google Sheets, and other tabular data sources into interactive Julia sessions.
