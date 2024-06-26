# Strassen, pg 77

class Algorithms::Strassen
  def rec_mat_mult(x, y)
    raise 'wtf' if x.size != y.size
    size = x.size
    return [[x[0][0] * y[0][0]]] if size == 1
    raise 'wtf' unless is_pow2(x.size)
    half_size = size / 2
    a = extract_submatrix(x, 0, 0, half_size)
    b = extract_submatrix(x, 0, half_size, half_size)
    c = extract_submatrix(x, half_size, 0, half_size)
    d = extract_submatrix(x, half_size, half_size, half_size)
    e = extract_submatrix(y, 0, 0, half_size)
    f = extract_submatrix(y, 0, half_size, half_size)
    g = extract_submatrix(y, half_size, 0, half_size)
    h = extract_submatrix(y, half_size, half_size, half_size)
    p1 = rec_mat_mult(a, subtract(f, h))
    p2 = rec_mat_mult(add(a, b), h)
    p3 = rec_mat_mult(add(c, d), e)
    p4 = rec_mat_mult(d, subtract(g, e))
    p5 = rec_mat_mult(add(a, d), add(e, h))
    p6 = rec_mat_mult(subtract(b, d), add(g, h))
    p7 = rec_mat_mult(subtract(a, c), add(e, f))
    construct_matrix(
      add(subtract(add(p5, p4), p2), p6), add(p1, p2),
      add(p3, p4), subtract(subtract(add(p1, p5), p3), p7),
      half_size
    )
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
    sub_m = []
    m[row..(row+size-1)].each do |sub_row|
     sub_m << sub_row[col..(col+size-1)]
    end
    sub_m
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

  def subtract(a, b)
    size = a.size
    z = create_matrix(size)
    size.times do |row|
      size.times do |col|
        z[row][col] = a[row][col] - b[row][col]
      end
    end
    z
  end

  # | a b |
  # | c d |, where a, b, c, and d are submatrices
  def construct_matrix(a, b, c, d, half_size)
    x = []
    half_size.times do |row|
      x << [a[row], b[row]].flatten
    end
    half_size.times do |row|
      x << [c[row], d[row]].flatten
    end
    x
  end
end
