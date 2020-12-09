PREAMBLE_LENGTH = 25

numbers = STDIN.each_line.map(&.to_i64).to_a

(PREAMBLE_LENGTH...numbers.size).each do |pos|
  number = numbers[pos]

  should_contain_sum_of_number = numbers[(pos - PREAMBLE_LENGTH)...pos]

  contains_sum = false

  should_contain_sum_of_number.each_combination(2).each do |comb|
    if comb.sum == number
      contains_sum = true
      break
    end
  end

  unless contains_sum
    puts number
    exit 0
  end
end
