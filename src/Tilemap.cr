require "crsfml"
require "csv"

require "./ScreenLayer.cr"
require "./Tileset.cr"

# TODO: map as module, so that both Tilemap and Colmap can include it.
# TODO: sprite as module included by ImageLayer, Tileset and RenderComponent
class Tilemap < ScreenLayer
    #include R2::Map
    @rows = -1
    @cols = -1

    def initialize(tilemap : File, @tileset : Tileset, @depth = 1.0)
        @map = Array(Int32).new

        map = CSV.new(tilemap)

        while (map.next)
            @map += (map.row.to_a.map {|s| s.to_i})
        end
    
        #puts @map.to_s
    end

    def [](i) : Int
         @map[i]
    end

    def at(i, j)
        self[j * @size.x, i]
    end

    def read()
    end

    def tileset(tileset : Tileset)
        @tileset = tileset
    end


    def render(window) #, camera : Point(Int32) = Point.new(0,0)
        @mapsize.y.times do |j|
            @mapsize.x.times do |i|
                x, y = i * @tilesize.x, j * @tilesize.y

                # Skip off-window rendering
                if (x < 0 || x > window.size.x) || (y < 0 || y > window.size.y)
                
                end

                # Main Action
                window.render(@tileset[self.at[i, j]])
            end
        end
    end
end
