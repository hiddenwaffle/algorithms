require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_11
    str = 'vzbxkghb'
    loop do
      str = inc(str)
      break if valid?(str)
    end
    puts str
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

  def valid?(str)
    # 1) Must include one increasing straight of at least three letters
    #   Examples: abc, bcd, cde, and so on, up to xyz
    return false unless contains_straight?(str)
    # 2) May not contain the letters i, o, or l
    return false unless contains_iol?(str)
    # 3) Must contain at least two different, non-overlapping pairs of letters
    #   Examples: aa, bb, or zz
    # TODO: Check this
    return false unless contains_two_pairs?(str)
    true
  end

  def contains_straight?(str)
    ords = str.chars.map(&:ord)
    found = false
    (ords.length-2).times do |i|
      if ords[i+1] == ords[i]+1 && ords[i+2] == ords[i]+2
        found = true
        break
      end
    end
    found
  end

  def contains_iol?(str)
    return false if str.include?('i')
    return false if str.include?('o')
    return false if str.include?('l')
    true
  end

  def contains_two_pairs?(str)
    letters = str.chars.uniq
    pair_count = 0
    letters.each do |letter|
      pair_count += 1 if contains_pair?(str, letter)
    end
    pair_count >= 2
  end

  def contains_pair?(str, letter)
    found = false
    chars = str.chars
    (chars.length-1).times do |i|
      if chars[i] == chars[i+1] && chars[i] == letter
        found = true
        break
      end
    end
    found
  end
end

AoC::AoC_2015.new.day_11
