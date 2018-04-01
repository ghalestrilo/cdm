require "./ScreenLayer.cr"
require "./Sprite.cr"

class ImageLayer < ScreenLayer
    include Sprite

    def render(window : SF::Window)
    end
end
