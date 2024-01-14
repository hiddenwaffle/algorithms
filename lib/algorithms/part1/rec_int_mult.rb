# RecIntMult, pg 9

class Algorithms::RecIntMult
  def rec_int_mult(x_int, y_int)
    absolute = rec_int_mult_loop(*pad(x_int.abs, y_int.abs)).to_i
    # Account for negative
    (x_int < 0) ^ (y_int < 0) ? absolute * -1 : absolute
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

  # The numbers need to be strings that are the same length,
  # and the length must be a power of 2.
  # @param [Integer] n
  # @return [String]
  def pad(x, y)
    x_str = x.to_s
    y_str = y.to_s
    x_len = x_str.length
    y_len = y_str.length
    length = x_len > y_len ? x_len : y_len
    pad_amount = next_pow2(length)
    [x_str.rjust(pad_amount, '0'), y_str.rjust(pad_amount, '0')]
  end
end
