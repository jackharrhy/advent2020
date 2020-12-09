PREAMBLE_LENGTH = 25

NUMBERS = STDIN.each_line.map(&.to_i64).to_a

invalid_num = (PREAMBLE_LENGTH...NUMBERS.size).each do |pos|
  number = NUMBERS[pos]
  last_length_of_numbers = NUMBERS[(pos - PREAMBLE_LENGTH)...pos]
  break number unless last_length_of_numbers.each_combination(2).each.find { |c| c.sum == number }
end

exit 1 if invalid_num.nil?

(2..NUMBERS.size).each do |size|
  (NUMBERS.size - size + 1).times do |pos|
    slice = NUMBERS[pos...(pos + size)]
    if slice.sum == invalid_num
      puts slice.min + slice.max 
      exit 0
    end
  end
end

exit 1
