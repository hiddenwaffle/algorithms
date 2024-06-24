# Compare the number of primes of the form 4n + 1
# and the number of primes of the form 4n + 3
# for a range of values of n.
# Can you make any conjectures about the relationship between these numbers?

require 'csv'
require 'prime'
require 'pry'
require_relative '../number_theory'

class NumberTheory::OddPrimes
  def initialize
    @cache = []
  end

  def compare
    count = ->(n, offset) do
      (0..n).map { |x| 4*x+offset }.reduce { |acc, x| prime?(x) ? acc += 1 : acc }
    end
    CSV.open('tmp/odd_primes.csv', 'wb') do |csv|
      (0..200).each do |n|
        n *= 10000 # Speed things up
        four_n_plus_1s = count.call(n, 1)
        four_n_plus_3s = count.call(n, 3)
        csv << [n, (four_n_plus_1s - four_n_plus_3s).abs]
      end
    end
  end

  private

  def prime?(x)
    @cache[x].nil? ? @cache[x] = x.prime? : @cache[x]
  end
end

NumberTheory::OddPrimes.new.compare
# [5, 13, 17, 29, 37, 41, 53, 61, 73, 89, 97, 101, 109, 113, 137, 149, 157, 173, 181, 193, 197]
# [3,  7, 11, 19, 23, 31, 43, 47, 59, 67, 71,  79,  83, 103, 107, 127, 131, 139, 151, 163, 167, 179, 191, 199]
