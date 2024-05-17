require_relative '../aoc_2015'

EXAMPLE = <<~EOF
  London to Dublin = 464
  London to Belfast = 518
  Dublin to Belfast = 141
EOF

class AoC::AoC_2015
  def day_9
    input = EXAMPLE # File.read("#{__dir__}/9_single_night.input")
  end
end

AoC::AoC_2015.new.day_9
