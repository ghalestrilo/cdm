
abstract class ScreenLayer
    #abstract def scale(x, y)
    abstract def render(window : SF::Window)
end
# NOTE: Filters can be implemented by grabbing the window content inside the render method.
