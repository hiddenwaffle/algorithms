# Straightforward Matrix Multiplication, pg 74

class Algorithms::MatrixMult
  def matrix_mult(a, b)
    z = create_matrix(a.size)
    require 'pry'; binding.pry
  end

  private

  def create_matrix(size)
    Array.new(size) { Array.new(size )}
  end
end
