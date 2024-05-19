require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_11
    str = 'zw'
    10.times do |i|
      break
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
end

AoC::AoC_2015.new.day_11
