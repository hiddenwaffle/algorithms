# Straightforward Matrix Multiplication, pg 74

class Algorithms::MatrixMult
  def matrix_mult(x, y)
    size = x.size
    z = create_matrix(size)
    size.times do |row|
      size.times do |col|
        z[row][col] = dot(x[row], extract_col(y, col))
      end
    end
    z
  end

  private

  def create_matrix(size)
    Array.new(size) { Array.new(size)}
  end

  def extract_col(m, col)
    arr = []
    m.size.times do |row|
      arr << m[row][col]
    end
    arr
  end

  def dot(a, b)
    raise 'wtf' if a.size != b.size
    acc = 0
    a.size.times do |i|
      acc += a[i] * b[i]
    end
    acc
  end
end
