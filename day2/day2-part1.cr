valid = 0

STDIN.each_line do |line|
  nums, char, password = line.split(' ')

  lower, upper = nums.split('-').map(&.to_i)
  char = char[0]

  count = 0
  password.each_char do |piece|
    count += 1 if piece == char
  end

  valid += 1 if (count >= lower) && (count <= upper)
end

puts valid
