require "crsfml"

require "../State.cr"
require "../Sprite.cr"
require "../Component.cr"
require "../Geometry.cr"
require "../Tilemap.cr"
require "../ScreenLayer.cr"
require "../ImageLayer.cr"
require "../components/Render.cr"

BGFILE  = "./assets/img/bg1.png"
ACORN   = "./assets/img/acorn.png" 
TILESET = "./assets/img/template_tileset.png"
TILEMAP = "./assets/map/template_map.csv"

# TODO: Maybe wrap states in States module, so that PlayState becomes States::Play
class PlayState < State
    include R2
    @quit = false
    @pop  = false

    def initialize(@game : Game)
        
        window = @game.window
       
        # Building Sreen Layers
        @layers = Array(ScreenLayer).new
        @layers.push ImageLayer.new(resources.get_image(BGFILE), R2::Rect.new(R2::Point(Int32).new, window.size))
        @mainlayer = 1

        @layers.push Tilemap.new(File.open(TILEMAP), Tileset.new(resources.get_image(TILESET))) 
    end

    def render
        window = @game.window

        @layers.each   { |l| l.render window } 
        @entities.each { |e| e.render window }
    end

    def update(dt : Float)
        input = @game.input

        if input.press? SF::Mouse::Left
            @entities.push(
                Entity.new(
                    Component::Render.new(
                        @resources.get_image(ACORN),
                        Rect(Int32).new(input.get_mouse,
                            Point.new(64, 64)), true)))
        end

        # State Logic

        # quit => poderia ir para metodo? (pop tambem?)
        @quit = input.quit ||
                (input.down?  SF::Keyboard::Up) ||
                (input.press? SF::Keyboard::Down)
   

        if @quit
            @entities.clear
            @layers.clear
        end
    end
     
    def quit_requested?
        @quit
    end

    def pop_requested?
        @pop
    end
end
