require_relative '../aoc_2015'

# EXAMPLE = <<~'EOF'
#   ""
#   "abc"
#   "aaa\"aaa"
#   "\x27"
# EOF

class AoC::AoC_2015
  def day_8
    num_codes = 0
    input = File.read("#{__dir__}/8_matchsticks.input")
    input.lines.map { |line| line.strip }.each do |line|
      num_codes += line.size
    end
    num_chars = 0
    input.lines.map { |line| line.strip }.each do |line|
      # require 'pry'; binding.pry
      num_chars += eval(line).size
    end
    puts "num_codes:  #{num_codes}"
    puts "num_chars:  #{num_chars}"
    puts "Final:      #{num_codes - num_chars}"
  end
end

AoC::AoC_2015.new.day_8
