count = 0

STDIN.gets_to_end.split("\n\n").each do |group|
  seen_passwords = ('a'..'z').to_a
  group.split("\n").each do |person|
    next if person == ""
    seen_passwords = seen_passwords & person.chars
  end
  count += seen_passwords.size
end

puts count
