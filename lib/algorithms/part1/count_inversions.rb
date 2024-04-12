# Counting Inversions in O(n log n) time, pg 62

class Algorithms::CountInversions
  def sort_and_count_inv(arr)
    raise "Given array size, #{arr.size}, must be a power of 2" unless power_of_2?(arr.size)
    if arr.empty? || arr.size == 1
      [arr, 0]
    else
      # https://stackoverflow.com/a/42709169
      half_count = arr.size / 2
      arr_left_half = arr.take(half_count)
      arr_right_half = arr.drop(half_count)
      c, left_inv = sort_and_count_inv(arr_left_half)
      d, right_inv = sort_and_count_inv(arr_right_half)
      b, split_inv = merge_and_count_split_inv(c, d)
      [b, left_inv + right_inv + split_inv]
    end
  end

  private

  def merge_and_count_split_inv(left, right)
    arr = []
    i = 1
    j = 1
    n = left.size + right.size
    split_inv = 0
    until left.empty? || right.empty?
      if left[0] < right[0]
        arr.push(left.shift)
        i += 1
      else
        arr.push(right.shift)
        j += 1
        split_inv += (n/2) - i + 1
      end
    end
    arr.concat(left)
    arr.concat(right)
    [arr, split_inv]
  end

  # https://stackoverflow.com/a/600306
  def power_of_2?(n)
    (n != 0) && ((n & (n - 1)) == 0)
  end
end
