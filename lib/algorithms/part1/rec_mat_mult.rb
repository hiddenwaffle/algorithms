# RecMatMult, pg 76

class Algorithms::RecMatMult
  def rec_mat_mult(x, y)
    raise 'wtf' if x.size != y.size
    size = x.size
    return [x[0][0] * y[0][0]] if size == 1
    raise 'wtf' unless is_pow2(x.size)
    half_size = size / 2
    a = extract_submatrix(x, 0, 0, half_size)
    b = extract_submatrix(x, 0, half_size-1, half_size)
    c = extract_submatrix(x, half_size-1, 0, half_size)
    d = extract_submatrix(x, half_size-1, half_size-1, half_size)
    e = extract_submatrix(y, 0, 0, half_size)
    f = extract_submatrix(y, 0, half_size-1, half_size)
    g = extract_submatrix(y, half_size-1, 0, half_size)
    h = extract_submatrix(y, half_size-1, half_size-1, half_size)
    # TODO: Use the submatrices as seen on page 75
    require 'pry'; binding.pry
  end

  private

  # Determine if the given number if a power of 2
  # https://stackoverflow.com/a/600306
  def is_pow2(n)
    (n & (n - 1)) == 0
  end

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

  def extract_submatrix(m, row, col, size)
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
