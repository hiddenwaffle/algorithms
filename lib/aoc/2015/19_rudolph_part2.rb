require_relative '../aoc_2015'

# TODO: This takes too long

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
# TERMINALS: Rn Ar C Y
# TODO: Count these in relation to each other in the input

Theorem = Data.define(:pattern, :offset)

class AoC::AoC_2015
  def day_19_part_2
    molecule = EXAMPLE_MOLECULE; input = EXAMPLE
    # molecule = MOLECULE; input = INPUT
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
    binding.pry
  end
end

AoC::AoC_2015.new.day_19_part_2
