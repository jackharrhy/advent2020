VALID_EYE_COLORS = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

valid = {
  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  "byr" => ->(v : String) {
    return false if v.size != 4
    i = v.to_i
    1920 <= i <= 2002
  },

  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  "iyr" => ->(v : String) {
    return false if v.size != 4
    i = v.to_i
    2010 <= i <= 2020
  },

  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  "eyr" => ->(v : String) {
    return false if v.size != 4
    i = v.to_i
    2020 <= i <= 2030
  },

  # hgt (Height) - a number followed by either cm or in:
  #  If cm, the number must be at least 150 and at most 193.
  #  If in, the number must be at least 59 and at most 76.
  "hgt" => ->(v : String) {
    if v.ends_with?("cm")
      150 <= v[0..-3].to_i <= 193
    elsif v.ends_with?("in")
      59 <= v[0..-3].to_i <= 76
    end
  },

  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  "hcl" => ->(v : String) {
    /#([0-9]|[a-z]){6}/ =~ v != nil
  },

  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  "ecl" => ->(v : String) { VALID_EYE_COLORS.includes?(v) },

  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  "pid" => ->(v : String) { return v.size == 9 && v.to_i? != nil },
}

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
  if keys == required_fields
    passport_valid = true
    passport.each do |k, v|
      key_valid = valid[k].call(v)
      passport_valid = false unless key_valid
    end
    valid_passports += 1 if passport_valid
  end
end

puts valid_passports
