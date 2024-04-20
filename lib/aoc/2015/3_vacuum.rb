require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_3
    input = File.read(__dir__ + '/3_vacuum.txt')
    x = 0
    y = 0
    houses = ['0x0']
    input.each_char do |c|
      case c
      when '^'
        y -= 1
      when 'v'
        y += 1
      when '>'
        x += 1
      when '<'
        x -= 1
      end
      houses << "#{x}x#{y}"
    end
    puts houses.uniq.count
  end
end

AoC::AoC_2015.new.day_3
