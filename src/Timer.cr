require "crsfml"

# Timer: Defaults to Seconds
class Timer
    @clock : SF::Clock = SF::Clock.new
    
    @elapsed = 0.0

    @running : Bool = true

   
    def initialize(@limit = 0.0)
    end

    def restart
        @clock.restart
        @paused = 0.0
    end

    def elapsed
        @clock.get_elapsed_time
    end
    
    def start
        @running = true
    end

    def pause
        @paused = @clock.restart
        @running = false
    end

    def resume
        @clock.restart
    end

    def done?
        self.elapsed + @paused > @limit
    end
end
