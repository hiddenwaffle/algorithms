require 'pry'
require_relative '../number_theory'

class NumberTheory::SieveOfEratosthenes
  def sieve(n)
    sqrt_n = Math.sqrt(n).floor
    numbers = (2..n).to_a
    (2..sqrt_n).each do |base|
      multiples = numbers.filter { |c| c > base && c % base == 0 }
      numbers -= multiples
    end
    numbers
  end
end

pp NumberTheory::SieveOfEratosthenes.new.sieve(1_000_000)
