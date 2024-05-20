require 'json'
require_relative '../aoc_2015'

# EXAMPLE = '[-1,{"a":1}]'
# EXAMPLE = '{"a":{"b":4},"c":-1}'

class AoC::AoC_2015
  def day_12_part_2
    obj = JSON.parse(File.read("#{__dir__}/12_abacus.input"))
    puts sum(obj)
  end

  private

  def sum(obj)
    if obj.class == Array
      obj.map { |e| sum(e) }.reduce(:+)
    elsif obj.class == Hash
      if obj.values.include?('red')
        0
      else
        obj.values.map { |e| sum(e) }.reduce(:+)
      end
    elsif obj.class == Integer
      obj
    else
      0
    end
  end
end

AoC::AoC_2015.new.day_12_part_2
