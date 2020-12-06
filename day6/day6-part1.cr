groups = STDIN.gets_to_end.split("\n\n")

count = 0

groups.each do |group|
  letters = {} of Char => Bool
  group.split("\n").each do |person|
    person.chars.each do |c|
      letters[c] = true
    end
  end

  count += letters.size
end

puts count
