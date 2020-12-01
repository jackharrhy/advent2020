nums = [] of Int32

STDIN.each_line do |line|
  nums << line.to_i
end

val1 = 0
val2 = 0
found = false

nums.each do |x|
  nums.each do |y|
    if x + y == 2020
      found = true
      val1 = x
      val2 = y
      break
    end
  end
  break if found
end

p val1 * val2
