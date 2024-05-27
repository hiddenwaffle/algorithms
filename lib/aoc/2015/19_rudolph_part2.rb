require_relative '../aoc_2015'

EXAMPLE_MOLECULE = 'OHOHOHOHO' # 'HOH' # 'HOHOHO'
EXAMPLE = <<~EOF
  e => H
  e => O
  H => HO
  H => OH
  O => HH
EOF

MOLECULE = 'CRnCaSiRnBSiRnFArTiBPTiTiBFArPBCaSiThSiRnTiBPBPMgArCaSiRnTiMgArCaSiThCaSiRnFArRnSiRnFArTiTiBFArCaCaSiRnSiThCaCaSiRnMgArFYSiRnFYCaFArSiThCaSiThPBPTiMgArCaPRnSiAlArPBCaCaSiRnFYSiThCaRnFArArCaCaSiRnPBSiRnFArMgYCaCaCaCaSiThCaCaSiAlArCaCaSiRnPBSiAlArBCaCaCaCaSiThCaPBSiThPBPBCaSiRnFYFArSiThCaSiRnFArBCaCaSiRnFYFArSiThCaPBSiThCaSiRnPMgArRnFArPTiBCaPRnFArCaCaCaCaSiRnCaCaSiRnFYFArFArBCaSiThFArThSiThSiRnTiRnPMgArFArCaSiThCaPBCaSiRnBFArCaCaPRnCaCaPMgArSiRnFYFArCaSiThRnPBPMgAr'
INPUT = File.read "#{__dir__}/19_rudolph.input"

class AoC::AoC_2015
  def day_19_part_2
    molecule = EXAMPLE_MOLECULE
    input = EXAMPLE
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

  def find_shortest_path(start, target, replacements, step=1)
    puts '---'
    molecules = Set.new
    replacements.each do |(from, to)|
      indices = find_indices(start, from, 0)
      indices.each do |index|
        to.each do |substr|
          # TODO: breadth-first instead of depth-first
          molecules << replace_at(start, index, from.size, substr)
        end
      end
    end
    molecules.map do |molecule|
      if molecule == target
        puts "#{step} #{molecule} <-------------------------"
      else
        puts "#{step} #{molecule}"
      end
    end
    return step if molecules.include?(target)
    steps = molecules.map do |molecule|
      find_shortest_path(molecule, target, replacements, step+1) if molecule.size <= target.size
    end.compact
    steps.min
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
