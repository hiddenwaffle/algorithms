require_relative '../aoc_2015'

EXAMPLE_MOLECULE = 'HOH'
EXAMPLE = <<~EOF
  H => HO
  H => OH
  O => HH
EOF

# MOLECULE = 'CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr'
# INPUT = File.read "#{__dir__}/19_rudolph.input"

class AoC::AoC_2015
  def day_19
    molecule = EXAMPLE_MOLECULE
    input = EXAMPLE
    replacements = parse_replacements(input)
    count = count_distinct_molecules(molecule, replacements)
    puts "Count: #{count}"
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

  def count_distinct_molecules(original, replacements)
    molecules = Set.new
    replacements.each do |(from, to)|
      indices = find_indices(original, from)
      binding.pry
    end
    molecules.size
  end

  def find_indices(str, substr)
    index = str.index(substr)
    return nil if index.nil?
    [index, *find_indices(str[(index + substr.size)..], substr)]
  end
end

AoC::AoC_2015.new.day_19
