require "crsfml"
require "./Geometry.cr"

module Sprite
    include R2
    
    def initialize(@texture : SF::Texture, @box = Rect(Int32).new, centered = false, @smooth = true)
        @sprite  = SF::Sprite.new texture
        
        resize(@box.width.to_f, @box.height.to_f)
        if centered == true
            center(box.left, box.top)
        else
            position(box.left, box.top)
        end
    end

    def open(texture : Texture, smooth = true)
        @texture.update(texture)
        @texture.smooth = smooth
    end

    def render(window : SF::RenderWindow)
        window.draw(@sprite)
    end

    # TEMP
    def texture_size
        @texture.size
    end

    def sprite_size
        {@box.width, @box.height}
    end

    def scale(x, y)
        @sprite.scale = (SF.vector2(x, y))
        @box.width  = (@box.width  * x).to_i
        @box.height = (@box.height * y).to_i 
    end

    def position(x, y)
        @sprite.set_position(x.to_f, y.to_f)
    end

    def center(x, y)
        w, h = sprite_size
        self.position(x - w/2, y - h/2)
    end

    def resize(w : Float, h : Float)
        x, y = texture_size
        scale(w / x.to_f , h / y.to_f) 
    end
    
    def clip(x, y, w, h)
        @sprite.texture_rect = SF.int_rect(x, y, w, h)
    end
end
