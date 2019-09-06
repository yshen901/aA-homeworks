class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

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