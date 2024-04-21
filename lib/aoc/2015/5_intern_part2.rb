require_relative '../aoc_2015'

class AoC::AoC_2015
  TWO_LETTERS_WITH_ONE_BETWEEN = Regexp.new('([A-Za-z]).\1')

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
    a = two_letters_twice_no_overlap?(str)
    return unless a
    b = one_letter_between?(str)
    return unless b
    true
  end

  def two_letters_twice_no_overlap?(str)
    length = str.length
    pairs = []
    (str.length-2).times do |i|
      pairs << str[i..i+1]
    end
    found = false
    pairs.each do |pair|
      if str.match /#{pair}.*#{pair}/
        found = true
        break
      end
    end
    found
  end

  def one_letter_between?(str)
    TWO_LETTERS_WITH_ONE_BETWEEN.match?(str)
  end
end

AoC::AoC_2015.new.day_5_part_2
