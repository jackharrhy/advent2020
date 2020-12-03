TREE = '#'

map = [] of String

STDIN.each_line do |line|
  map << line
end

max_x = map[0].size
max_y = map.size - 1

cases = Array(Array(Int32)).new

cases << [1,1]
cases << [3,1]
cases << [5,1]
cases << [7,1]
cases << [1,2]

trees_hit_in_each_case = [] of Int64

cases.each do |c|
  pos_x = c[0]
  pos_y = c[1]

  hit_trees = 0_i64

  while pos_y <= max_y
    pos_x -= max_x if pos_x >= max_x
    hit_trees += 1 if map[pos_y][pos_x] == TREE

    pos_x += c[0]
    pos_y += c[1]
  end

  trees_hit_in_each_case << hit_trees
end

puts trees_hit_in_each_case.product
