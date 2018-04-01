

class Config
    @winres : (x : UInt32, y : UInt32)
    
    def initialize
    end

    def load(filename : String)
        if !FILE.file? filename
            abort "[config] could not open file: #{filename}"
        end
    end
end
