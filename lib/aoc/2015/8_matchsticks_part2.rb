require_relative '../aoc_2015'

# EXAMPLE = <<~'EOF'
#   ""
#   "abc"
#   "aaa\"aaa"
#   "\x27"
# EOF

class AoC::AoC_2015
  def day_8_part_2
    input = File.read("#{__dir__}/8_matchsticks.input")
    num_chars = 0 # "should be 2x the characters of the original strings' counts"
    input.lines.map do |line|
      line.strip.chars.flat_map do |c|
        case c
        when "\\"
          ["\\", "\\"]
        when "\""
          ["\\", "\""]
        else
          [c]
        end
      end.join
    end.each do |line|
      puts line
      num_chars += line.size + 2 # 2 to make up for removing the outer quotes
    end
    num_codes = 0
    input.lines.map { |line| line.strip }.each do |line|
      num_codes += line.size
    end
    puts "num_chars: #{num_chars}"
    puts "num_codes: #{num_codes}"
    puts "Final:     #{num_chars - num_codes}"
  end
end

AoC::AoC_2015.new.day_8_part_2
