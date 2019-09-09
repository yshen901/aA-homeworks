require_relative './graph_node.rb'
require 'set'

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs (starting_node, target_value)
    return starting_node if starting_node.value == target_value

    traversed_nodes = []
    to_search = [starting_node]
    until to_search.empty?
        current_node = to_search.shift
        return current_node if current_node.value == target_value

        traversed_nodes << current_node
        current_node.neighbors.each do |neighbor|
            to_search << neighbor unless traversed_nodes.include?(neighbor)
        end
    end
    nil
end

puts bfs(a, "b").inspect
puts bfs(a, "f").inspect

