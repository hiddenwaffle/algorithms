require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_11
    str = 'zw'
    10.times do |i|
      str = inc(str)
      puts str
    end
    # require 'pry'; binding.pry
  end

  private

  def inc(str)
    inc_last(str)
  end

  def inc_last(str)
    return '' if str.empty?
    return 'aa' if str == 'z'
    last = str[-1]
    if last == 'z'
      "#{inc_last(str[..-2])}a"
    else
      "#{str[..-2]}#{(last.ord + 1).chr}"
    end
  end

  def validate(str)
    # 1) Must include one increasing straight of at least three letters
    #   Examples: abc, bcd, cde, and so on, up to xyz
    # TODO: Loop x=0 to length-3, with range x..(x+2)
    # 2) May not contain the letters i, o, or l
    return false if str.includes?('i')
    return false if str.includes?('o')
    return false if str.includes?('l')
    # 3) Must contain at least two different, non-overlapping pairs of letters
    #   Examples: aa, bb, or zz
  end
end

AoC::AoC_2015.new.day_11
