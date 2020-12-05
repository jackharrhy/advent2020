required_fields = [
  "byr",
  "iyr",
  "eyr",
  "hgt",
  "hcl",
  "ecl",
  "pid",
].sort

input = STDIN.gets_to_end
cases = input.split("\n\n")

valid_passports = 0

cases.each do |c|
  passport = {} of String => String

  c.split("\n").each do |line|
    pieces = line.split(" ")

    pieces.each do |piece|
      next if piece == ""
      field, value = piece.split(":")
      passport[field] = value
    end
  end

  passport.delete("cid")

  keys = passport.keys.sort
  valid_passports += 1 if keys == required_fields
end

puts valid_passports
