valid = 0

STDIN.each_line do |line|
  nums, char, password = line.split(' ')

  index1, index2 = nums.split('-').map(&.to_i)
  char = char[0]

  char_at_index1 = password[index1 - 1]
  char_at_index2 = password[index2 - 1]

  next if char_at_index1 == char_at_index2
  next if (char_at_index1 != char) && (char_at_index2 != char)

  valid += 1
end

puts valid
