require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_5_part_2
    count = 0
    input = File.read("#{__dir__}/5_intern.input")
    input.lines.each do |line|
      count += 1 if nice?(line)
    end
    puts count
  end

  private

  def nice?(str)
    false # TODO
  end
end

AoC::AoC_2015.new.day_5_part_2
