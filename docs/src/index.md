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
![](img/screenshot_copy.gif)

### Paste an image
![](img/screenshot_paste.gif)
