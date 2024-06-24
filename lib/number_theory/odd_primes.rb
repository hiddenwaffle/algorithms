# Compare the number of primes of the form 4n + 1
# and the number of primes of the form 4n + 3
# for a range of values of n.
# Can you make any conjectures about the relationship between these numbers?

require 'csv'
require 'prime'
require 'pry'
require_relative '../number_theory'

class NumberTheory::OddPrimes
  def compare
    four_n_plus_1 = 0
    four_n_plus_3 = 0
    CSV.open('tmp/odd_primes.csv', 'wb') do |csv|
      (0..10_000_000).each do |n|
        four_n_plus_1 += (4*n+1).prime? ? 1 : 0
        four_n_plus_3 += (4*n+3).prime? ? 1 : 0
        csv << [n, four_n_plus_1 - four_n_plus_3] if n % 50_000 == 0
      end
    end
  end
end

NumberTheory::OddPrimes.new.compare
