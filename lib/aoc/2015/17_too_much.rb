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

class AoC::AoC_2015
  def day_17
    total_liters = EXAMPLE_TOTAL_LITERS # 150
    input = EXAMPLE # File.read "#{__dir__}/17_too_much.input"
    containers = input.lines.map do |line|
      line.strip.to_i
    end
    results = calc_possibilities(total_liters, containers)
    puts '---'
    pp results
    binding.pry
  end

  private

  def calc_possibilities(target, arr)
    if arr.size == 0
      []
    elsif arr.size == 1 # TODO: Would it ever actually get here?
      [arr]
    else
      possibilities = []
      arr.each.with_index do |e, i|
        next_target = target - e
        if next_target > 0
          next_arr = arr.dup.tap { |a| a.delete_at(i) }
          # puts "target: #{target}, arr: #{arr.inspect}, e: #{e}, next_target: #{next_target}, next_arr: #{next_arr.inspect}"
          tails = calc_possibilities(next_target, next_arr)
          inc_recursive_depths
          tails.each do |tail|
            next_possibility = [e, *tail]
            possibilities << next_possibility if next_possibility.sum == target
          end
        elsif next_target == 0
          # puts "target: #{target}, arr: #{arr.inspect}, e: #{e}, next_target: #{next_target} - FIT <<<<<<<<<<<<<<<<<<"
          possibilities << [e]
        else
          # puts "target: #{target}, arr: #{arr.inspect}, e: #{e}, next_target: #{next_target} - END, NO FIT"
        end
      end
      possibilities
    end
  end

  def inc_recursive_depths
    $recursive_depths += 1
    puts "recursive_depths: #{$recursive_depths}" if $recursive_depths % 100000 == 0
  end
end

AoC::AoC_2015.new.day_17
