require_relative '../aoc_2015'

EXAMPLE = <<~EOF
  Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
  Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
EOF

IngredientType = Data.define(:name, :capacity, :durability, :flavor, :texture, :calories)
Ingredient = Data.define(:type, :amount)
Cauldron = Data.define(:ingredients)

class AoC::AoC_2015
  def day_15_part2
    input = File.read("#{__dir__}/15_hungry.input")
    ingredient_types = parse_ingredient_types(input)
    puts find_best_score(ingredient_types)
  end

  private

  def parse_ingredient_types(input)
    input.lines.map do |line|
      parse_ingredient_type(line)
    end
  end

  def parse_ingredient_type(line)
    match = line.match /^(.*): capacity (.*), durability (.*), flavor (.*), texture (.*), calories (.*)$/
    name, capacity_str, durability_str, flavor_str, texture_str, calories_str = match[1..6]
    IngredientType.new(
      name: name,
      capacity: capacity_str.to_i,
      durability: durability_str.to_i,
      flavor: flavor_str.to_i,
      texture: texture_str.to_i,
      calories: calories_str.to_i
    )
  end

  def find_best_score(ingredient_types)
    max = 100
    possibilities = calc_possibilities(max, ingredient_types.count)
    puts "Number of possibilities #{possibilities.count}"
    highest = 0
    possibilities.each.with_index do |possibility, i|
      score, calories = calc_score_and_calories(ingredient_types, possibility)
      if calories == 500
        highest = score if score > highest
      end
    end
    highest
  end

  def calc_possibilities(max, spaces)
    # Example: max = 5
    # spaces = 0 => 0 possibilities
    #   []
    # spaces = 1 => 1 possibility
    #   [5]
    # spaces = 2 => 6 possibilities
    #   [0,5], [1,4], [2,3], [3,2], [4,1], [5,0]
    # spaces = 3 => 21 possibilities
    #   [5,0,0],
    #   [4,1,0], [4,0,1],
    #   [3,2,0], [3,1,1], [3,0,2],
    #   [2,3,0], [2,2,1], [2,1,2], [2,0,3],
    #   [1,4,0], [1,3,1], [1,2,2], [1,1,3], [1,0,4]
    #   [0,5,0], [0,4,1], [0,3,2], [0,2,3], [0,1,4], [0,0,5]
    if spaces == 0
      []
    elsif spaces == 1
      [max]
    else
      possibilities = []
      (0..max).each do |i|
        tails = calc_possibilities(max-i, spaces-1)
        tails.each do |tail|
          next_possibility = [i, *tail]
          possibilities << next_possibility
        end
      end
      possibilities
    end
  end

  def calc_score_and_calories(ingredient_types, amounts)
    raise 'wtf' if ingredient_types.count != amounts.count
    calc = method(:calc_property_score).curry.(ingredient_types, amounts)
    score = calc.(:capacity) * calc.(:durability) * calc.(:flavor) * calc.(:texture)
    calories = calc.(:calories)
    [score, calories]
  end

  def calc_property_score(ingredient_types, amounts, property)
    scores = []
    ingredient_types.count.times do |i|
      scores << ingredient_types[i].send(property) * amounts[i]
    end
    total = scores.reduce(:+)
    total > 0 ? total : 0
  end
end

AoC::AoC_2015.new.day_15_part2
