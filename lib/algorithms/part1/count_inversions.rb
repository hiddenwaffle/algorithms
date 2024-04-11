# Counting Inversions in O(n log n) time, pg 62

class Algorithms::CountInversions
  def sort_and_count_inv(arr)
    if arr.empty? || arr.size == 1
      0
    else
      # https://stackoverflow.com/a/42709169
      arr_left_half = arr.take(half_count)
      arr_right_half = arr.drop(half_count)
      c, left_inv = sort_and_count_inv(arr_left_half)
      d, right_inv = sort_and_count_inv(arr_right_half)
      b, split_inv = merge_and_count_split_inv(c, d)
      [b, left_inv + right_inv + split_inv]
    end
  end

  def merge_and_count_split_inv(left, right)
  end
end
