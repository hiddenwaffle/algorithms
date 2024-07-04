require_relative '../number_theory'

class NumberTheory::GCD
  def gcd(a, b)
    loop do
      q = a / b
      r = a % b
      puts "#{a} = #{q}\u2219#{b} + #{r}"
      return b if r == 0
      a = b
      b = r
    end
  end
end

# puts NumberTheory::GCD.new.gcd(1234, 981)
# puts NumberTheory::GCD.new.gcd(100313, 34709)
# puts NumberTheory::GCD.new.gcd(252, 198)
# puts NumberTheory::GCD.new.gcd(139, 91)
puts NumberTheory::GCD.new.gcd(123_456_789, 10_000_000_001)
