require_relative '../aoc_2015'

# width is constant
#
# ribbon required is the shortest distance around its sides
#   a.k.a. smallest perimeter of any one face
#
# bow: cubic feet of volume of the present (l*w*h)
#
# examples:
#   2x3x4   requires  2+2+3+3=10 + 2*3*4=24 ====== 34
#   1x1x10  requires  1+1+1+1=4 + 1*1*10=10 ====== 14
class AoC::AoC_2015
  def day_2_part_2
    input = File.read "#{__dir__}/2_no_math.txt"
    total_ribbon_len = 0
    input.lines do |line|
      l, w, h = line.split('x')
      l = l.to_i
      w = w.to_i
      h = h.to_i
      len = ribbon_length(l, w, h)
      bow_len = bow_ribbon_length(l, w, h)
      total_ribbon_len += len + bow_len
    end
    puts total_ribbon_len
  end

  private

  def ribbon_length(*dim)
    a, b = dim.sort.take(2)
    2*a + 2*b
  end

  def bow_ribbon_length(l, w, h)
    l*w*h
  end
end

AoC::AoC_2015.new.day_2_part_2
