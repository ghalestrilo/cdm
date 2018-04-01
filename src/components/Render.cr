require "crsfml"
require "../Component.cr"
require "../Sprite.cr"

module Component
    class Render < Component
        getter sprite : Sprite
        def initialize(image, box = Rect.new, centered = false)
            @sprite = Sprite.new(image, box, centered) 
        end

        def code
            Code::Render
        end
    end
end
