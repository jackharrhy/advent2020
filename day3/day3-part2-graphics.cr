TREE = '#'

map = [] of String
drawing = [] of String

STDIN.each_line do |line|
  map << line
  drawing << line
end

max_x = map[0].size
max_y = map.size - 1

cases = Array(Array(Int32)).new

cases << [1, 1]
cases << [3, 1]
cases << [5, 1]
cases << [7, 1]
cases << [1, 2]

trees_hit_in_each_case = [] of Int64

def clear
  print "\033c"
end

clear

cases.each do |c|
  pos_x = c[0]
  pos_y = c[1]

  hit_trees = 0_i64

  current_drawing = drawing.clone

  while pos_y <= max_y
    if pos_x >= max_x
      pos_x -= max_x
      current_drawing = drawing.clone
    end

    if map[pos_y][pos_x] == TREE
      hit_trees += 1
      current_drawing[pos_y] = drawing[pos_y].sub(pos_x, "X")
    else
      current_drawing[pos_y] = drawing[pos_y].sub(pos_x, "O")
    end

    pos_x += c[0]
    pos_y += c[1]

    clear
    puts "case: #{c}"
    puts "hit trees: #{hit_trees}\n\n"
    current_drawing.each do |line|
      puts line
    end
    sleep(0.1)
  end

  puts "\nDONE #{c}"
  sleep(2)

  trees_hit_in_each_case << hit_trees
end

puts "FINISHED!, product of trees hit in each case is #{trees_hit_in_each_case.product}"
