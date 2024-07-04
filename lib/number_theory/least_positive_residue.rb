require 'pry'
require_relative '../number_theory'

class NumberTheory::LeastPositiveResidue
  # 2^n (mod m)
  def do_it(n, m)
    n_2 = n.to_s(2)
    puts "n as binary: #{n_2}\n"
    factors = n_2.reverse.chars.map(&:to_i).map.with_index do |bit, index|
      if bit == 0
        nil
      else
        exp = 2.pow(index)
        factor = 2.pow(exp).modulo(m)
        puts "2^#{exp} = #{factor} (mod #{m})"
        factor
      end
    end.compact
    lpr = factors.reduce(&:*).modulo(m)
    puts "2^{#{n}} = #{factors.join(' * ')} = #{lpr} (mod #{m})"
  end
end

# NumberTheory::LeastPositiveResidue.new.do_it(61, 43) # 32 (mod 43)
# NumberTheory::LeastPositiveResidue.new.do_it(32, 47) # 42 (mod 47)
# NumberTheory::LeastPositiveResidue.new.do_it(47, 47) # 2 (mod 47)
NumberTheory::LeastPositiveResidue.new.do_it(200, 47) # 18 (mod 47)
