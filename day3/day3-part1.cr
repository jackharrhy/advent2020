TREE = '#'

map = [] of String

STDIN.each_line do |line|
  map << line
end

max_x = map[0].size
max_y = map.size - 1

pos_x = 3
pos_y = 1

hit_trees = 0

while pos_y <= max_y
  pos_x -= max_x if pos_x >= max_x
  hit_trees += 1 if map[pos_y][pos_x] == TREE

  pos_x += 3
  pos_y += 1
end

puts hit_trees
