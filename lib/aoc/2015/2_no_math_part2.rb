input = File.read "#{__dir__}/2_no_math.txt"

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

def surface_area_and_slack(l, w, h)
  a = l * w
  b = w * h
  c = h * l
  slack = [a, b, c].min
  2*a + 2*b + 2*c + slack
end

total_sa = 0
input.lines do |line|
  l, w, h = line.split('x')
  l = l.to_i
  w = w.to_i
  h = h.to_i
  total_sa += surface_area_and_slack(l, w, h)
end

puts total_sa
