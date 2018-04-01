require "./Component.cr"
require "./State.cr"

# Opcao: 
#   - Tornar Entity agnostico em relacao a State
#   - State conter systems que dao update em entities
class Entity
    include Component
    getter components = Hash(Code, Component).new

    def initialize; end

    def initialize(*comps : Component)
        comps.each do |c|
            components[c.code] = c
        end
    end

    def update(state : State)
        
    end

    def render(window)
        if rc = @components[Code::Render]
            rc.sprite.render(window)
        end
    end
end
