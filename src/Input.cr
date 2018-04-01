require "crsfml"

alias Key   = SF::Keyboard
alias Mouse = SF::Mouse

class Input
    #include SF::Keyboard
    #include SF::Mouse
    getter quit : Bool

    @quit  = false

    #TODO: reimplement as bool hash
    @framekeys   = Hash(SF::Keyboard::Key, Bool).new
    @frameclicks = Hash(SF::Mouse::Button, Bool).new

    def initialize(@window : SF::Window);end

    def update
        @framekeys.clear
        @frameclicks.clear

        while event = @window.poll_event
            case event
                when SF::Event::Closed
                    @quit = true

                when SF::Event::KeyEvent::KeyPressed
                    @framekeys[event.code] = true
                
                when SF::Event::KeyEvent::KeyReleased
                    @framekeys[event.code] = false

                when SF::Event::MouseButtonEvent::MouseButtonPressed
                    @frameclicks[event.button] = true
                
                when SF::Event::MouseButtonEvent::MouseButtonReleased
                    @frameclicks[event.button] = false
            end
        end
    end

    def press? (b : Key::Key | Mouse::Button)
        ((b.is_a? Key::Key) ?
            (@framekeys.fetch(b)   {|b| @framekeys[b]   = false} == true) :
            (@frameclicks.fetch(b) {|b| @frameclicks[b] = false} == true))
    end

    def get_mouse
        SF::Mouse.get_position(@window)
    end

    # TODO: Fix method
    def down? (b : Key::Key | Mouse::Button)
        if b.is_a? Key::Key
            SF::Keyboard.key_pressed? b
        end
        
        if b.is_a? Mouse::Button
            SF::Mouse.button_pressed? b
        end

        return false
    end
end
