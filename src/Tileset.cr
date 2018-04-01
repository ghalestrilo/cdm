require "crsfml"
require "./Geometry.cr"
require "./Sprite.cr"

class Tileset
    include R2
    
    @texturesize : Point(Int32)
    @count       : Int32
    @mapsize     : Point(Int32)

    def initialize(texture : SF::Texture, ts_x = 64, ts_y = 64)

        # Block: 'open' method
        @sprite      = Sprite.new(texture)
        @texturesize = Point(Int32) {texture.size}
        @tilesize    = Point(Int32).new(ts_x, ts_y)
        @mapsize     = Point(Int32).new(@texturesize.y/@tilesize.y, @texturesize.x / @tilesize.x)
        @count       = (@texturesize.y/@tilesize.y) * (@texturesize.x / @tilesize.x)
    end

    # SETS the sprite clip area
    def [](i : Int) : SF::Sprite
        if (i < 0) || (i > @count)
            abort "[tileset] attempt to access tile of index #{i} - tileset ends at #{@count}"
        end

        pos_x = i % (@texturesize.x / @tilesize.x)
        pos_y = i / (@texturesize.x / @tilesize.x)
        @sprite.clip(pox_x, pos_y, @tilesize.x, @tilesize.y) 
    end


end
