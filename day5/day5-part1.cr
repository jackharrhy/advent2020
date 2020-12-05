def bsp(line, lower, upper)
  index = 0

  line.size.times do
    c = line[index]
    if c == 'F' || c == 'L'
      upper -= ((upper - lower) // 2) + 1
    else
      lower += ((upper - lower) // 2) + 1
    end

    index += 1
  end

  lower
end

highest_id = 0

STDIN.each_line do |line|
  row_marker = line[0..-4]
  seat_marker = line[7..-1]

  row = bsp(row_marker, 0, 127)
  seat = bsp(seat_marker, 0, 7)

  id = row * 8 + seat
  highest_id = id if id > highest_id
end

puts highest_id
