class GraphNode
    attr_reader :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(nodes)
        nodes.each do |node|
            @neighbors << node unless @neighbors.include?(node)
        end
    end

    def inspect
        { value:@value, neighbors:@neighbors }
    end
end