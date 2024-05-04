# RecMatMult, pg 76

class Algorithms::RecMatMult
  def rec_mat_mult(x, y)
    require 'pry'; binding.pry
  end

  private

  def create_matrix(size)
    Array.new(size) { Array.new(size)}
  end

  def extract_col(m, col)
    size = m.size
    arr = []
    size.times do |row|
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

  def add(a, b)
    size = a.size
    z = create_matrix(size)
    size.times do |row|
      size.times do |col|
        z[row][col] = a[row][col] + b[row][col]
      end
    end
    z
  end
end
