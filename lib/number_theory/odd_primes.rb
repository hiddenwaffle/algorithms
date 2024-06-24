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
      (0..50_000_000).each do |n|
        four_n_plus_1 += 1 if (4*n+1).prime?
        four_n_plus_3 += 1 if (4*n+3).prime?
        if n % 500_000 == 0
          arr = [n, four_n_plus_3 - four_n_plus_1] # to get a positive value (most of the time?)
          pp arr
          csv << arr
        end
      end
    end
  end
end

NumberTheory::OddPrimes.new.compare
