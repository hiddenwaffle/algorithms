require_relative '../aoc_2015'

# EXAMPLE_TIME = 1000
# EXAMPLE = <<~EOF
#   Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
#   Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
# EOF

Racer = Data.define(:name, :speed, :stamina, :recovery)

class AoC::AoC_2015
  def day_14
    # Input
    input = File.read("#{__dir__}/14_olympics.input")
    time = 2503 # EXAMPLE_TIME
    # Processing
    racers = parse_racers(input)
    puts race(time, racers)
  end

  private

  def parse_racers(input)
    input.lines.map do |line|
      match = line.match /^(.*) can fly (.*) km\/s for (.*) seconds, but then must rest for (.*) seconds.$/
      name, speed_str, stamina_str, recovery_str = match[1..4]
      Racer.new(
        name: name,
        speed: speed_str.to_i,
        stamina: stamina_str.to_i,
        recovery: recovery_str.to_i
      )
    end
  end

  def race(time, racers)
    highest = 0
    racers.each do |racer|
      distance = race_single(time, racer)
      highest = distance if distance > highest
    end
    highest
  end

  def race_single(time, racer)
    flying_ttl = racer.stamina
    resting_ttl = 0
    distance = 0
    time.times do
      case
      when flying_ttl > 0
        distance += racer.speed
        flying_ttl -= 1
        resting_ttl = racer.recovery if flying_ttl.zero?
      when resting_ttl > 0
        resting_ttl -= 1
        flying_ttl = racer.stamina if resting_ttl.zero?
      end
    end
    distance
  end
end

AoC::AoC_2015.new.day_14
