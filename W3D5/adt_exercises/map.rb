class Map
    def initialize
       @map = [] 
    end

    def set(key, value)
        self.get(key) || @map << [key, value]
    end

    def get(key)
        @map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        value = self.get(key)
        @map.delete([key,value]) if value
    end

    def show
        display = "{ "
        @map.each { |pair| display << "#{pair[0]}=>#{pair[1]}, " }
        puts display[0...-2] + " }"
    end
end