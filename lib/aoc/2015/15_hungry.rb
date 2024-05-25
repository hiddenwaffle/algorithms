require_relative '../aoc_2015'

EXAMPLE = <<~EOF
  Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
  Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
EOF

IngredientType = Data.define(:name, :capacity, :durability, :flavor, :texture, :calories)
Ingredient = Data.define(:type, :amount)
Cauldron = Data.define(:ingredients)

class AoC::AoC_2015
  def day_15
    input = EXAMPLE
    ingredient_types = parse_ingredient_types(input)
    puts compute_score(ingredient_types, [44, 56])
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

  def compute_score(ingredient_types, amounts)
    raise 'wtf' if ingredient_types.count != amounts.count
    calc = method(:compute_property_score).curry.(ingredient_types, amounts)
    calc.(:capacity) * calc.(:durability) * calc.(:flavor) * calc.(:texture)
  end

  def compute_property_score(ingredient_types, amounts, property)
    scores = []
    ingredient_types.count.times do |i|
      scores << ingredient_types[i].send(property) * amounts[i]
    end
    scores.reduce(:+)
  end
end

AoC::AoC_2015.new.day_15
