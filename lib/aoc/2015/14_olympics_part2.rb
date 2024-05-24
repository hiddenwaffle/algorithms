require_relative '../aoc_2015'

# EXAMPLE_TIME = 1000
# EXAMPLE = <<~EOF
#   Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
#   Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
# EOF

Racer = Struct.new(:name, :speed, :stamina, :recovery, :distance, :flying_ttl, :resting_ttl, :points)

class AoC::AoC_2015
  def day_14_part_2
    # Input
    input = File.read("#{__dir__}/14_olympics.input")
    time = 2503
    # Processing
    racers = parse_racers(input)
    winner = race(time, racers)
    puts racers
    puts 'WINNER:'
    puts winner
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
        recovery: recovery_str.to_i,
        distance: 0,
        flying_ttl: stamina_str.to_i,
        resting_ttl: 0,
        points: 0
      )
    end
  end

  def race(time, racers)
    time.times do
      racers.each do |racer|
        step(racer)
      end
      award_point(racers)
    end
    find_winner(racers)
  end

  def step(racer)
    case
    when racer.flying_ttl > 0
      racer.distance += racer.speed
      racer.flying_ttl -= 1
      racer.resting_ttl = racer.recovery if racer.flying_ttl.zero?
    when racer.resting_ttl > 0
      racer.resting_ttl -= 1
      racer.flying_ttl = racer.stamina if racer.resting_ttl.zero?
    end
  end

  def award_point(racers)
    leaders = find_leaders(racers)
    leaders.each do |leader|
      leader.points += 1
    end
  end

  def find_leaders(racers)
    farthest = racers.reduce(0) { |farthest, current| farthest > current.distance ? farthest : current.distance  }
    racers.filter { |racer| racer.distance == farthest }
  end

  def find_winner(racers)
    racers.reduce { |leader, current| leader.points > current.points ? leader : current }
  end
end

AoC::AoC_2015.new.day_14_part_2
