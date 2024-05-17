require 'set'
require_relative '../aoc_2015'

# EXAMPLE = <<~EOF
#   London to Dublin = 464
#   London to Belfast = 518
#   Dublin to Belfast = 141
# EOF

class AoC::AoC_2015
  def day_9_part2
    input = File.read("#{__dir__}/9_single_night.input")
    # First find the locations
    locations = Set.new
    input.lines.each do |line|
      from, _, to, _, distance = line.split
      locations << from
      locations << to
    end
    # Construct database
    database = {}
    input.lines.each do |line|
      from, _, to, _, distance_str = line.split
      database["#{from} -> #{to}"] = distance_str.to_i
    end
    # Now capture the longest total distance for each route
    longest = 0
    routes = locations.sort.permutation
    routes.each do |route|
      distance = 0
      route.each_cons(2).each do |pair|
        a, b = pair
        distance += database["#{b} -> #{a}"] || database["#{a} -> #{b}"]
      end
      longest = distance if distance > longest
    end
    puts longest
  end
end

AoC::AoC_2015.new.day_9_part2
