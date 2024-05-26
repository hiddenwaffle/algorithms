require_relative '../aoc_2015'

EXAMPLE_TOTAL_LITERS = 25
EXAMPLE = <<~EOF
  20
  15
  10
  5
  5
EOF

$recursive_depths = 0
$cache = {}

Container = Struct.new(:id, :capacity)

class AoC::AoC_2015
  def day_17
    total_liters = 150
    input = File.read "#{__dir__}/17_too_much.input"
    containers = input.lines.map.with_index do |line, i|
      capacity = line.strip.to_i
      Container.new(id: i, capacity: capacity)
    end
    results_arr = calc_possibilities(total_liters, containers)
    pp results_arr
    puts '---'
    results = results_arr.map(&:to_set).uniq
    puts '---'
    pp results
    puts "Count: #{results.count}"
  end

  private

  def calc_possibilities(target, containers)
    if containers.size == 0
      []
    elsif containers.size == 1 # TODO: Would it ever actually get here?
      [containers]
    else
      return $cache[[target, containers]] if $cache.has_key?([target, containers])
      possibilities = []
      containers.each.with_index do |container, i|
        next_target = target - container.capacity
        if next_target > 0
          next_containers = containers.dup.tap { |a| a.delete_at(i) }
          tails = calc_possibilities(next_target, next_containers)
          inc_recursive_depths
          tails.each do |tail|
            next_possibility = [container, *tail]
            remaining_capacity = next_possibility.reduce(0) { |acc, container| acc + container.capacity }
            possibilities << next_possibility if remaining_capacity == target
          end
        elsif next_target == 0
          possibilities << [container]
        else
          # TBD
        end
      end
      $cache[[target, containers]] = possibilities
      possibilities
    end
  end

  def inc_recursive_depths
    $recursive_depths += 1
    puts "recursive_depths: #{$recursive_depths}" if $recursive_depths % 100000 == 0
  end
end

AoC::AoC_2015.new.day_17
