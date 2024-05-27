require_relative '../aoc_2015'

EXAMPLE_MOLECULE = 'HOH'
EXAMPLE = <<~EOF
  H => HO
  H => OH
  O => HH
EOF

MOLECULE = 'CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr'
INPUT = File.read "#{__dir__}/19_rudolph.input"

class AoC::AoC_2015
  def day_19
    molecule = MOLECULE # EXAMPLE_MOLECULE
    input = INPUT # EXAMPLE
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
      indices = find_indices(original, from, 0)
      # puts "indices: #{indices.inspect}, original: #{original}, from: #{from}"
      indices.each do |index|
        to.each do |substr|
          # puts "index: #{index}, #{from} => #{substr}"
          molecules << replace_at(original, index, from.size, substr)
        end
      end
    end
    # pp molecules
    molecules.size
  end

  def find_indices(str, substr, start)
    index = str.index(substr)
    return [] if index.nil?
    [start+index, *find_indices(str[(index + substr.size)..], substr, start+index+substr.size)]
  end

  def replace_at(str, index, size, substr)
    # puts "Replacing #{str} from #{index} to #{index+size-1} with #{substr}"
    before = index.zero? ? '' : str[..index-1]
    "#{before}#{substr}#{str[(index+size)..]}"
  end
end

AoC::AoC_2015.new.day_19
