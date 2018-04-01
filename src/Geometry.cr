require "crsfml"

module R2
    alias Point = SF::Vector2

    alias Rect  = SF::Rect
   
    struct SF::Vector2(T)
        def <<(t : Tuple(T, T))
            self.x, self.y = t

        end

        def <<(t : Vector2(T))
            self.x, self.y = t.x, t.y
        end
    end
    
    struct SF::Rect(T)
        def <<(t : Tuple(T, T, T, T))
            self.x, self.y, self.w, self.h = t
        end
    end
end

module R3
    alias Point = SF::Vector3
end
