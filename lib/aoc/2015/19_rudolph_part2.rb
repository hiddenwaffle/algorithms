require_relative '../aoc_2015'

# TODO:
#   * Notice that the size of every replacement is >= the original's size (never shrinks)
#   * 'C' is a terminal, occurs only once in the target, and is the left-most element
#   * 'Rn' is right next to it and is also a terminal
#   * The next terminal is 3 elements over and is 'Rn'
#   * Looks like the only way to get 'CRnCaSiRn' is for:
#     * e => H or  =>

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

Theorem = Data.define(:pattern, :offset)

class AoC::AoC_2015
  def day_19_part_2
    # molecule = EXAMPLE_MOLECULE; input = EXAMPLE
    molecule = MOLECULE; input = INPUT
    molecule_arr = molecule_to_arr(molecule)
    replacements = parse_replacements(input)
    terminals = find_terminals(replacements)
    binding.pry
    puts find_shortest_path(['e'], molecule_arr, replacements)
  end

  private

  def molecule_to_arr(molecule)
    molecule.chars.join(' ').gsub(/([A-Z]) ([a-z])/, '\1\2').split(' ')
  end

  def parse_replacements(input)
    replacements = {}
    input.lines.each do |line|
      match = line.match /^(.+) => (.+)$/
      from, to = match[1..]
      to_arr = molecule_to_arr(to)
      if replacements.has_key?(from)
        replacements[from] << to_arr
      else
        replacements[from] = [to_arr]
      end
    end
    replacements
  end

  def find_terminals(replacements)
    replacements.values.flatten.flat_map { |m| molecule_to_arr(m) }.sort.uniq - replacements.keys
  end

  def find_shortest_path(start, target, replacements)
  end
end

AoC::AoC_2015.new.day_19_part_2
