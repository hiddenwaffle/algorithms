require_relative '../aoc_2015'

# EXAMPLE = <<~EOF
#   Alice would gain 54 happiness units by sitting next to Bob.
#   Alice would lose 79 happiness units by sitting next to Carol.
#   Alice would lose 2 happiness units by sitting next to David.
#   Bob would gain 83 happiness units by sitting next to Alice.
#   Bob would lose 7 happiness units by sitting next to Carol.
#   Bob would lose 63 happiness units by sitting next to David.
#   Carol would lose 62 happiness units by sitting next to Alice.
#   Carol would gain 60 happiness units by sitting next to Bob.
#   Carol would gain 55 happiness units by sitting next to David.
#   David would gain 46 happiness units by sitting next to Alice.
#   David would lose 7 happiness units by sitting next to Bob.
#   David would gain 41 happiness units by sitting next to Carol.
# EOF

class AoC::AoC_2015
  def day_13
    input = File.read("#{__dir__}/13_dinner_part2.input")
    effects = {}
    input.lines.each do |line|
      effect_key, amount = parse_line(line)
      effects[effect_key] = amount
    end
    names = extract_names(effects)
    puts calculate_highest_happiness_for_names(effects, names)
  end

  private

  def parse_line(line)
    match_data = line.match /^(.*) would (.*) (.*) happiness units by sitting next to (.*).$/
    subject, action, amount_str, neighbor = match_data[1..4]
    case action
    when 'gain'
      amount = amount_str.to_i
    when 'lose'
      amount = amount_str.to_i * -1
    else
      raise 'wtf'
    end
    [key_from(subject, neighbor), amount]
  end

  def key_from(subject, neighbor)
    [subject, neighbor]
  end

  def extract_names(effects)
    effects.keys.map { |k| k[0] }.uniq
  end

  def calculate_highest_happiness_for_names(effects, names)
    highest = 0
    names.permutation.each do |seating_order|
      happiness = calculate_happiness_for_seating_order(effects, seating_order)
      highest = happiness if happiness > highest
    end
    highest
  end

  def calculate_happiness_for_seating_order(effects, seating_order)
    first_happiness = happiness_for(effects, seating_order[-1], seating_order[0], seating_order[1])
    last_happiness = happiness_for(effects, seating_order[-2], seating_order[-1], seating_order[0])
    other_happiness = 0
    (1..(seating_order.size-2)).each do |i|
      other_happiness += happiness_for(effects, seating_order[i-1], seating_order[i], seating_order[i+1])
    end
    first_happiness + last_happiness + other_happiness
  end

  def happiness_for(effects, left, subject, right)
    left_happiness = effects[[subject, left]]
    right_happiness = effects[[subject, right]]
    if left_happiness == nil || right_happiness == nil
      raise "WTF: #{left} #{subject} #{right}"
    end
    left_happiness + right_happiness
  end
end

AoC::AoC_2015.new.day_13
