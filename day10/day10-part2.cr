NUMBERS = STDIN.each_line.map(&.to_i).to_a
NUMBERS << 0
NUMBERS << NUMBERS.max + 3
NUMBERS.sort!

MEMO = Hash(Int32, Int64).new

def paths(index)
  return MEMO[index] if MEMO.has_key?(index)

  number = NUMBERS[index]
  return 1 if number == NUMBERS.max

  valid_paths = 0_i64

  (1..3).each do |distance|
    offset = index + distance
    break if offset >= NUMBERS.size

    offset_number = NUMBERS[offset]
    diff = offset_number - number

    valid_paths += paths(offset) if 1 <= diff <= 3
  end

  MEMO[index] = valid_paths
  valid_paths
end

puts paths(0)
