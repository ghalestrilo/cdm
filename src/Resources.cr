require "crsfml"

class Resources
    @resources = Hash(String, (SF::Texture)).new
    
    def get_image(filename : String)
        @resources.fetch(filename) { |f|
            if File.file? filename
                puts "[resources] file: \"#{filename}\" added to media pool"
                @resources[filename] = SF::Texture.from_file(filename)
            else
                abort "[resources]: cannot open file #{filename}"
            end
        }
    end
end
