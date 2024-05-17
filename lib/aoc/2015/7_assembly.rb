require_relative '../aoc_2015'

# EXAMPLE = <<~EOF
#   123 -> x
#   456 -> y
#   x AND y -> d
#   x OR y -> e
#   x LSHIFT 2 -> f
#   y RSHIFT 2 -> g
#   NOT x -> h
#   NOT y -> i
# EOF

EXAMPLE = <<~EOF
  NOT y -> i
  NOT x -> h
  y RSHIFT 2 -> g
  x LSHIFT 2 -> f
  x OR y -> e
  x AND y -> d
  456 -> y
  123 -> x
EOF

class AoC::AoC_2015
  def day_7
    input = File.read "#{__dir__}/7_assembly.input"
    leftovers = input.lines
    loop do
      break if leftovers.empty?
      leftovers = execute(leftovers)
      puts vars
    end
    puts vars
  end

  private

  def execute(lines)
    leftovers = []
    lines.each do |line|
      tokens = line.split
      case tokens.size
      when 3 # Assignment
        a = tokens[0]
        target = tokens[2]
        if Integer(a, exception: false)
          vars[target] = a.to_i
        else
          if vars[a].nil?
            leftovers << line
          else
            vars[target] = vars[a]
          end
        end
      when 4 # Bitwise complement
        a = tokens[1]
        target = tokens[3]
        if vars[a].nil?
          leftovers << line
        else
          vars[target] = vars[a] ^ 65535
        end
      when 5 # Other bitwise operations
        a = tokens[0]
        op = tokens[1]
        b = tokens[2]
        target = tokens[4]
        left = Integer(a, exception: false) ? a.to_i : vars[a]
        right = Integer(b, exception: false) ? b.to_i : vars[b]
        # (require 'pry'; binding.pry) if target == 'lx'
        case op
        when 'AND'
          if left.nil? || right.nil?
            leftovers << line
          else
            vars[target] = left & right
          end
        when 'OR'
          if left.nil? || right.nil?
            leftovers << line
          else
            vars[target] = left | right
          end
        when 'LSHIFT'
          if left.nil?
            leftovers << line
          else
            vars[target] = left << b.to_i
          end
        when 'RSHIFT'
          if left.nil?
            leftovers << line
          else
            vars[target] = left >> b.to_i
          end
        else
          raise 'wtf'
        end
      else
        raise 'wtf'
      end
    end
    leftovers
  end

  def vars
    @vars ||= {}
  end
end

AoC::AoC_2015.new.day_7
