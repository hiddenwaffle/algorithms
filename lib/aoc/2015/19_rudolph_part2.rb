require_relative '../aoc_2015'

EXAMPLE_MOLECULE = 'HOHOHO'
EXAMPLE = <<~EOF
  e => H
  e => O
  H => HO
  H => OH
  O => HH
EOF

MOLECULE = 'CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr'
INPUT = File.read "#{__dir__}/19_rudolph.input"

$count = 0

class AoC::AoC_2015
  def day_19_part_2
    molecule = EXAMPLE_MOLECULE # MOLECULE
    input = EXAMPLE # INPUT
    replacements = parse_replacements(input)
    puts find_shortest_path('e', molecule, replacements)
  end

  private

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

  def find_shortest_path(start, target, replacements)
    $count += 1
    step = 1
    molecules = process(start, target, replacements)
    loop do
      next_molecules = molecules.flat_map do |molecule|
        process(molecule, target, replacements)
      end.compact.uniq.reject do |molecule|
        molecule.size > target.size
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

  def process(molecule, target, replacements)
    molecules = Set.new
    replacements.each do |(from, to)|
      indices = find_indices(molecule, from, 0)
      indices.each do |index|
        to.each do |substr|
          molecules << replace_at(molecule, index, from.size, substr)
        end
      end
    end
    molecules.to_a
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
end

AoC::AoC_2015.new.day_19_part_2
