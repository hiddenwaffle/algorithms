# Karatsuba, pg 11

class Algorithms::Karatsuba
  def karatsuba(x_int, y_int)
    karatsuba_loop(x_int.to_s, y_int.to_s)
  end

  private

  # @param [x] String
  # @param [y] String
  # @return [Integer]
  def karatsuba_loop(x, y)
    length = x.length # Assumes that x and y are the same length
    # Base case
    return (x.to_i * y.to_i).to_s if length == 1
    breakpoint = length / 2
    a = x[..breakpoint-1]
    b = x[breakpoint..]
    c = y[..breakpoint-1]
    d = y[breakpoint..]
    p = (a.to_i + b.to_i).to_s
    q = (c.to_i + d.to_i).to_s
    ac = karatsuba_loop(a, c)
    bd = karatsuba_loop(b, d)
    pq = karatsuba_loop(p, q)
    # <-- Notice that there is one fewer recursive call than RecIntMult
    adbc = pq.to_i - ac.to_i - bd.to_i
    10**length * ac.to_i + 10**(length/2) * adbc + bd.to_i
  end

  # Determine if the given number if a power of 2
  # https://stackoverflow.com/a/600306
  def is_pow2(n)
    (n & (n - 1)) == 0
  end

  # Find the next power of 2 above the given number
  def next_pow2(n)
    until is_pow2(n)
      n += 1
    end
    n
  end
end
