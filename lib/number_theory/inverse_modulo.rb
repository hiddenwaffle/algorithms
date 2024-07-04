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
# puts NumberTheory::InverseModulo.new.inverse_modulo(9, 31) # 7
# puts NumberTheory::InverseModulo.new.inverse_modulo(27, 392) # 363
# puts NumberTheory::InverseModulo.new.inverse_modulo(18, 19) # 18
# puts NumberTheory::InverseModulo.new.inverse_modulo(5, 10) # infinite loop
# puts NumberTheory::InverseModulo.new.inverse_modulo(17, 19) # 9
# puts NumberTheory::InverseModulo.new.inverse_modulo(35, 3) # 2
# puts NumberTheory::InverseModulo.new.inverse_modulo(21, 5) # 1
puts NumberTheory::InverseModulo.new.inverse_modulo(15, 7) # 1
