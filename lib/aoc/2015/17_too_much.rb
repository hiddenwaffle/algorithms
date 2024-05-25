require_relative '../aoc_2015'

EXAMPLE_TOTAL_LITERS = 25
EXAMPLE = <<~EOF
  20
  15
  10
  5
  5
EOF

class AoC::AoC_2015
  def day_17
    total_liters = EXAMPLE_TOTAL_LITERS # 150
    input = EXAMPLE # File.read "#{__dir__}/17_too_much.input"
    input.lines.each do |line|
    end
  end
end

AoC::AoC_2015.new.day_17
