using ImageClipboard
using Images
using Test
using InteractiveUtils
using Aqua

Aqua.test_all(ImageClipboard)

@testset "ImageClipboard.jl" begin

    @testset "RGB image copy & paste" begin
        img = rand(RGB{N0f8}, 100, 200)
        clipboard_img(img)
        img2 = clipboard_img()

        # FIXME, windows exception (#10)
        if Sys.iswindows()
            @test RGBA.(img) == img2
        else
            @test img == img2
        end
    end

    @testset "RGBA image copy & paste" begin
        img = rand(RGBA{N0f8}, 100, 200)
        clipboard_img(img)
        img2 = clipboard_img()

        # FIXME, windows exception (#10)
        if !Sys.iswindows()
            @test img == img2
        end
    end

    @testset "Error if no image" begin
        clipboard("")
        @test_throws ErrorException("No image in clipboard") clipboard_img()
    end

end
