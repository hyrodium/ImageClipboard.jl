# ImageClipboard.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://hyrodium.github.io/ImageClipboard.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hyrodium.github.io/ImageClipboard.jl/dev)
[![Build Status](https://github.com/hyrodium/ImageClipboard.jl/workflows/CI/badge.svg)](https://github.com/hyrodium/ImageClipboard.jl/actions)

Copy & Paste images with Julia

## Install
```
pkg> add ImageClipboard
```

## Usage

Just like `clipboard` in InteractiveUtils deals with string contents, this package provides `clipboard_img` to work with image contents:

```julia
using Images, ImageClipboard

# Create random image
img = rand(RGB{N0f8}, 100, 200)

# Copy to clipboard
clipboard_img(img)

# Paste image from clipboard
img2 = clipboard_img()

# These are the same images
img == img2
```

## Sample screenshots
### Copy an image
![](docs/src/img/screenshot_copy.gif)

### Paste an image
![](docs/src/img/screenshot_paste.gif)
