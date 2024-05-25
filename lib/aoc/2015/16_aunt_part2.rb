require_relative '../aoc_2015'

# SueType = Struct.new(:name, :children, :cats, :samoyeds, :pomeranians, :akitas, :vizslas, :goldfish, :trees, :cars, :perfumes)

TAPE = <<~EOF
  children: 3
  cats: 7
  samoyeds: 2
  pomeranians: 3
  akitas: 0
  vizslas: 0
  goldfish: 5
  trees: 3
  cars: 2
  perfumes: 1
EOF

class AoC::AoC_2015
  def day_16_part2
    input = File.read("#{__dir__}/16_aunt.input")
    sues = parse_lines(input.lines)
    clues = parse_clues(TAPE)
    puts search(sues, clues)
  end

  private

  def parse_lines(lines)
    lines.map do |line|
      match = line.match /^Sue (\d+): (.*)$/
      sue_id, properties_str = match[1].to_i, match[2]
      property_strs = properties_str.split(',').map(&:strip)
      properties = {}
      property_strs.each do |property_str|
        match = property_str.match /^(.+): (\d+)$/
        name, value = match[1], match[2].to_i
        properties[name] = value
      end
      properties['id'] = sue_id
      properties
    end
  end

  def parse_clues(tape)
    clues = {}
    tape.lines.each do |line|
      match = line.match /^(.+): (\d+)$/
      name, value = match[1], match[2].to_i
      clues[name] = value
    end
    clues
  end

  def search(sues, clues)
    candidates = sues.clone
    clues.each do |clue|
      clue_property_name, clue_property_value = clue
      candidates.reject! do |candidate|
        unless candidate[clue_property_name].nil?
          case clue_property_name
          when 'cats'
            candidate['cats'] <= clue_property_value
          when 'trees'
            candidate['trees'] <= clue_property_value
          when 'pomeranians'
            candidate['pomeranians'] >= clue_property_value
          when 'goldfish'
            candidate['goldfish'] >= clue_property_value
          else
            candidate[clue_property_name] != clue_property_value
          end
        end
      end
    end
    candidates
  end
end

AoC::AoC_2015.new.day_16_part2
