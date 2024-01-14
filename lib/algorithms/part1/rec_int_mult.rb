# RecIntMult, pg 9

class Algorithms::RecIntMult
  def rec_int_mult(x_int, y_int)
    rec_int_mult_loop(x_int.to_s, y_int.to_s)
  end

  private

  # @param [x] String
  # @param [y] String
  # @return [Integer]
  def rec_int_mult_loop(x, y)
    length = x.length # Assumes that x and y are the same length
    # Base case
    return (x.to_i * y.to_i).to_s if length == 1
    breakpoint = length / 2
    a = x[..breakpoint-1]
    b = x[breakpoint..]
    c = y[..breakpoint-1]
    d = y[breakpoint..]
    ac = rec_int_mult_loop(a, c)
    ad = rec_int_mult_loop(a, d)
    bc = rec_int_mult_loop(b, c)
    bd = rec_int_mult_loop(b, d)
    10**length * ac.to_i + 10**(length/2) * (ad.to_i + bc.to_i) + bd.to_i
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
