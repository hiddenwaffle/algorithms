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
        2.pow(exp).modulo(m)
      end
    end.compact
    lpr = factors.reduce(&:*).modulo(m)
    puts "2^{#{m}} = #{factors.join(' * ')} = #{lpr} (mod #{m})"
  end
end

puts NumberTheory::LeastPositiveResidue.new.do_it(61, 43)
