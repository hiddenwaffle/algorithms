require 'pry'
require_relative '../number_theory'

class NumberTheory::InverseModulo
  # a \equiv b \pmod m
  def inverse_modulo(d, m)
    i = 1
    loop do
      return i / d if i % d == 0
      i += m
    end
  end
end


# puts NumberTheory::InverseModulo.new.inverse_modulo(5, 7) # 3
puts NumberTheory::InverseModulo.new.inverse_modulo(9, 31)
