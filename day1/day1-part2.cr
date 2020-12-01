nums = [] of Int32

STDIN.each_line do |line|
  nums << line.to_i
end

val1 = 0
val2 = 0
val3 = 0
found = false

nums.each do |x|
  nums.each do |y|
    nums.each do |z|
      if x + y + z == 2020
        found = true
        val1 = x
        val2 = y
        val3 = z
        break
      end
    end
  end
  break if found
end

p val1 * val2 * val3
