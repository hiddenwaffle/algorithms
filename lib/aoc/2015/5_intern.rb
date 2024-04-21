require_relative '../aoc_2015'

class AoC::AoC_2015
  VOWELS = ['a', 'e', 'i', 'o', 'u']
  TWO_LETTERS_IN_A_ROW_REGEX = Regexp.new('([A-Za-z])\1+')
  TABOO_STRINGS = ['ab', 'cd', 'pq', 'xy']

  def day_5
    count = 0
    input = File.read("#{__dir__}/5_intern.input")
    input.lines.each do |line|
      count += 1 if nice?(line)
    end
    puts count
  end

  private

  def nice?(str)
    a = at_least_3_vowels?(str)
    return false unless a
    b = at_least_one_letter_twice_in_a_row?(str)
    return false unless b
    c = no_taboo_strings?(str)
    return false unless c
    true
  end

  # Contains at least 3 vowels
  def at_least_3_vowels?(str)
    vowel_count = 0
    VOWELS.each do |vowel|
      vowel_count += str.count(vowel)
    end
    vowel_count >= 3
  end

  def at_least_one_letter_twice_in_a_row?(str)
    TWO_LETTERS_IN_A_ROW_REGEX.match(str)
  end

  def no_taboo_strings?(str)
    TABOO_STRINGS.each do |taboo|
      return false if str.include?(taboo)
    end
    true
  end
end

AoC::AoC_2015.new.day_5
