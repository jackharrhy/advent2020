rules = Hash(String, Hash(String,Int32)).new
  
STDIN.each_line do |line|
  bag, raw_contains= line.split(" contain ")

  bag = bag.chomp(" bags")
  contains = {} of String => Int32

  if raw_contains != "no other bags."
    raw_contains.split(", ").each do |c|
      number, first, last = c.split(" ")
      contains["#{first} #{last}"] = number.to_i
    end
  end

  rules[bag] = contains
end

def contains_golden_bag(rules, bags)
  return false if bags.size == 0

  bags.each do |bag, count|
    return true if bag == "shiny gold"
    return true if contains_golden_bag(rules, rules[bag])
  end

  return false
end

count = 0
rules.each do |rule, bags|
  count += 1 if contains_golden_bag(rules, bags)
end

puts count
