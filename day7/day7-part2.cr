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

def children_bags(rules, bags)
  total_count = 0
  bags.each do |bag, count|
    total_count += count + count * children_bags(rules, rules[bag])
  end
  total_count
end

shiny = rules["shiny gold"]
rules.delete("shiny gold")

puts children_bags(rules, shiny)
