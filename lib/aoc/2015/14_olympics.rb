require_relative '../aoc_2015'

DISTANCE = 1120
EXAMPLE = <<~EOF
  Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
  Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
EOF

Racer = Data.define(:speed, :stamina, :recovery)

class AoC::AoC_2015
  def day_14
    input = EXAMPLE
    racers = parse_racers(input)
  end

  private

  def parse_racers(input)
    input.lines.map do |line|
      binding.pry
    end
  end
end

AoC::AoC_2015.new.day_14
