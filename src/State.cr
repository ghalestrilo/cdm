require "./Game.cr"
require "./Entity.cr"
require "./Resources.cr"

abstract class State

    getter entities  = Array(Entity).new
    getter resources = Resources.new

    abstract def render
    abstract def update(dt : Float)

    abstract def quit_requested? : Bool
    abstract def pop_requested?  : Bool
end
