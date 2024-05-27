require_relative '../aoc_2015'

EXAMPLE_MOLECULE = 'HOHOHO'
EXAMPLE = <<~EOF
  e => H
  e => O
  H => HO
  H => OH
  O => HH
EOF

# EXAMPLE_MOLECULE = 'HiOHiOHiO'
# EXAMPLE = <<~EOF
#   e => Hi
#   e => O
#   Hi => HiO
#   Hi => OHi
#   O => HiHi
# EOF

MOLECULE = 'CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr'
INPUT = File.read "#{__dir__}/19_rudolph.input"

# $count = 0

Theorem = Data.define(:pattern, :offset)

class AoC::AoC_2015
  def day_19_part_2
    molecule = EXAMPLE_MOLECULE; input = EXAMPLE
    # molecule = MOLECULE; input = INPUT
    replacements = parse_replacements(input)
    theorems = calc_valid_theorems(replacements)
    puts find_shortest_path('e', molecule, replacements.invert, theorems)
  end

  private

  def find_shortest_path(target, start, replacements, theorems)
      step = 1
      molecules = process(target, start, replacements, theorems)
      loop do
        count = 0
        next_molecules = Set.new
        molecules.flat_map do |molecule|
          count += 1
          puts "#{count} / #{molecules.size}" if count % 10000 == 0
          candidates = process(target, molecule, replacements, theorems)
          candidates.each do |candidate|
            next_molecules << candidate
          end
        end
        molecules = next_molecules
        step += 1
        puts '---'
        puts "#{step} - molecules.size: #{molecules.size}"
        pp molecules
        break if molecules.include?(target)
      end
      step
  end

  def process(target, start, replacements, theorems)
    molecules = Set.new
    replacements.each do |(from, to)|
      from.each do |substr|
        indicies = find_indices(start, substr, 0)
        indicies.each do |index|
          molecule = replace_at(start, index, substr.size, to)
          next if molecule.size != 1 && molecule.include?(target)
          next if has_irreplaceable?(molecule, theorems)
          molecules << molecule
        end
      end
    end
    molecules.to_a
  end

  def parse_replacements(input)
    replacements = {}
    input.lines.each do |line|
      match = line.match /^(.+) => (.+)$/
      from, to = match[1..]
      if replacements.has_key?(from)
        replacements[from] << to
      else
        replacements[from] = [to]
      end
    end
    replacements
  end

  def find_indices(str, substr, start)
    index = str.index(substr)
    return [] if index.nil?
    [start+index, *find_indices(str[(index + substr.size)..], substr, start+index+substr.size)]
  end

  def replace_at(str, index, size, substr)
    before = index.zero? ? '' : str[..index-1]
    "#{before}#{substr}#{str[(index+size)..]}"
  end

  def calc_valid_theorems(replacements)
    elements = replacements.keys
    patterns = replacements.values.flatten
    theorems = {}
    elements.each do |element|
      element_theorems = []
      matching_patterns = patterns.filter { |pattern| pattern.include?(element) }.reject { |e| e == element }
      matching_patterns.each do |matching_pattern|
        indices = find_indices(matching_pattern, element,0)
        indices.each do |index|
          element_theorems << Theorem.new(pattern: matching_pattern, offset: index*-1)
        end
      end
      element_theorems << Theorem.new(pattern: element, offset: 0)
      theorems[element] = element_theorems
    end
    theorems
  end

  def has_irreplaceable?(molecule, theorems)
    found = false
    theorems.each do |(element, element_theorems)|
      indices = find_indices(molecule, element, 0)
      indices.each do |index|
        # For each index there must be at least one matching element_theorem
        at_least_one_match = element_theorems.any? do |element_theorem|
          slice = molecule[(index+element_theorem.offset)..(index+element_theorem.offset+element_theorem.pattern.size-1)]
          slice == element_theorem.pattern
        end
        unless at_least_one_match # TODO: return?
          # binding.pry if element == 'H'
          found = true
          break
        end
        break if found # TODO: return?
      end
      break if found # TODO: return?
    end
    found
  end

  def has_at_least_one_match?
  end
end

AoC::AoC_2015.new.day_19_part_2
