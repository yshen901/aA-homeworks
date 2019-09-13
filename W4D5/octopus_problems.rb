#find the longest fish in O(n) time
def sluggish_octopus(fishes)
  fishes.each do |fish|
    longest = fishes.all? { |other_fish| other_fish.length <= fish.length }
    return fish if longest
  end
end


#find longest fish in O(n*log(n)) time
def dominant_octopus(fishes)
  fishes.sort { |fish_1, fish_2| fish_2.length <=> fish_1.length } [0]
end


#find the longest fish in O(1) time
def clever_octopus(fishes)
  best_fish = ""
  fishes.each { |fish| best_fish = fish if fish.length > best_fish.length}
  best_fish
end

#tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
#given this tiles array, give the tentacle number (index) of a direction

#do this is O(n)
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == direction }
  raise ArgumentError, "Invalid Direction!"
end

#do this in O(1)
def constant_dance(direction, tiles_array)
  tiles_hash = {}
  tiles_array.each_with_index { |tile, tentacle| tiles_hash[tile] = tentacle }
  tiles_hash[direction]
end