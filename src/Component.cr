
module Component

    enum Code 
        Render # Visual Component - Renderizable Sprite
        #Xeno (Xeno.new(target : Entity, rate : Float) # Implements Xeno Following Behavior towards target entity
    end

    abstract class Component
        abstract def code
    end
end
