numbers = STDIN.each_line.map(&.to_i).to_a
numbers << 0
numbers << numbers.max + 3
numbers.sort!

diffs = [] of Int32

numbers.each_with_index do |num, index|
  next if index == 0

  last_number = numbers[index - 1]

  diff = num - last_number
  exit 1 if diff > 3
  diffs << diff
end

puts diffs.count(1) * diffs.count(3)
