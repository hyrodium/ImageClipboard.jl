using ImageClipboard
using Images
using Test

@testset "ImageClipboard.jl" begin

    @testset "RGB image copy & paste" begin
        img = rand(RGB{N0f8}, 100, 200)
        clipboard_img(img)
        img2 = clipboard_img()
        @test img == img2
    end

    @testset "RGBA image copy & paste" begin
        img = rand(RGBA{N0f8}, 100, 200)
        clipboard_img(img)
        img2 = clipboard_img()
        @test img == img2
    end

end
