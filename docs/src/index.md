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
Just like `InteractiveUtils.clipboard` deals with string contents, this package provides [`clipboard_img`](@ref) function to work with image contents:

```julia
using ImageClipboard  # Exports `clipboard_img`
using ImageClipboard  # Exports `clipboard_img`
using Images

# Paste image with ImageClipboard.jl🎉🎉🎉
img = clipboard_img()

# Copy image with ImageClipboard.jl🎉🎉🎉
clipboard_img(Gray.(img))
```

![](demo.mp4)

## Julia Compatibility
For Julia versions older than `v"1.3"`, you need to manually install the image IO backend [ImageMagick.jl](https://github.com/JuliaIO/ImageMagick.jl) first.

## Other related packages
* [ClipData.jl](https://pdeffebach.github.io/ClipData.jl/dev/) enables users to copy/paste to/from Excel, Google Sheets, and other tabular data sources into interactive Julia sessions.

## Note on Naming

- **Package**: `ImageClipboard.jl` — follows Julia image package conventions (like [ImageFiltering.jl](https://github.com/JuliaImages/ImageFiltering.jl))
- **Function**: `clipboard_img()` — extends `InteractiveUtils.clipboard()`

The reversed word order is intentional to maintain consistency with existing Julia ecosystem patterns.
