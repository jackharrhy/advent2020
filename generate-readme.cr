record Lang, name : String, site : String

langs = {
  ".cr" => Lang.new("Crystal", "https://crystal-lang.org/")
}


puts <<-MARKDOWN
# (Some) [Advent of Code 2020](https://adventofcode.com/2020/) solutions!

Completed in:
MARKDOWN

langs.each do |extension, lang|
  puts "- [#{lang.name}](#{lang.site})"
end

puts <<-MARKDOWN
----

## Solution Index\n\n
MARKDOWN

Dir.glob("./day*").reverse.each do |day|
  pre, post = day.split("day")

  puts "### [Day #{post}](https://adventofcode.com/2020/day/#{post})\n\n"

  langs.each do |extension, lang|
    lang_files = Dir.glob("#{day}/*#{extension}")
    next if lang_files.size == 0
    puts "> #{lang.name}"
    lang_files.each do |file|
      path = Path[file]
      part = path.basename.split("part")[1].chomp(extension)
      puts "> - [Part #{part}](#{file})"
    end
    puts ""
  end
end
