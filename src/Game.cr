require "crsfml"

require "./State.cr"
require "./Input.cr"
require "./Timer.cr"

require "./states/PlayState.cr"

# Constants
FPS = 60

class Game
   
    getter input  : Input
    getter window : SF::RenderWindow
    #getter config : Config
    # TODO: read config file for: screen res, debug modes


    @fps     = FPS
    @eframes = 0.0
    @etime   = 0.0
    @timer   = Timer.new 1000.0
    @dt      = 0.0

    def initialize
        @states = Array(State).new
        @window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "My window")
       

        @input  = Input.new @window
        #@states.push(PlayState.new self)
        @nextstate = PlayState.new self
        
    end

    def run 
        while @window.open?
            # Input Processing
            @input.update

            # FPS Capping / Time Tracking
            sleep(self.hold)
            @etime   += (@dt = @timer.restart)
            @eframes += 1

            # State Manipulation
            if nextstate = @nextstate
                @states.push(nextstate)
            end
            @nextstate = nil
            
            state = @states.last

            # Frame Update
            state.update @dt
            if state.quit_requested?
                @window.close
            end
        
            # Frame Render
            state.render
            @window.display
        end
    end

    def pushstate(state : State)
        @nextstate = state
    end
    
    def hold
        if (@eframes < @fps) && (@etime < 1000)
            @eframes = 0
            @etime   = 0.0 
        end
 
        (1.0 - @etime)/(@fps - @eframes)
    end


    @states : Array(State)
    @nextstate : (State | Nil)
     
end
