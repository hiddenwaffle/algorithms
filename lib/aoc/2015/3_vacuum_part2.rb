require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_3
    input = File.read(__dir__ + '/3_vacuum.input')
    santa_x = 0
    santa_y = 0
    robo_x = 0
    robo_y = 0
    houses = ['0x0']
    turn = :santa
    input.each_char do |c|
      dx = 0
      dy = 0
      case c
      when '^'
        dy -= 1
      when 'v'
        dy += 1
      when '>'
        dx += 1
      when '<'
        dx -= 1
      end
      if turn == :santa
        santa_x += dx
        santa_y += dy
        houses << "#{santa_x}x#{santa_y}"
        turn = :robo
      else
        robo_x += dx
        robo_y += dy
        houses << "#{robo_x}x#{robo_y}"
        turn = :santa
      end
    end
    puts houses.uniq.count
  end
end

AoC::AoC_2015.new.day_3
