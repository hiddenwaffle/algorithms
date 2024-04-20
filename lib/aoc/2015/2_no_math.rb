require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_2
    input = File.read "#{__dir__}/2_no_math.txt"
    total_sa = 0
    input.lines do |line|
      l, w, h = line.split('x')
      l = l.to_i
      w = w.to_i
      h = h.to_i
      total_sa += surface_area_and_slack(l, w, h)
    end

    puts total_sa
  end

  private

  def surface_area_and_slack(l, w, h)
    a = l * w
    b = w * h
    c = h * l
    slack = [a, b, c].min
    2*a + 2*b + 2*c + slack
  end
end

AoC::AoC_2015.new.day_2
