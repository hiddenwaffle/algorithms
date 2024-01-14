# Mergesort, pg 16, 17

class Algorithms::MergeSort
  def merge_sort(arr)
    # Base cases
    return arr if arr.empty?
    return arr if arr.length == 1
    midpoint = arr.length / 2
    c = merge_sort(arr[..midpoint-1])
    d = merge_sort(arr[midpoint..])
    merge(c, d)
  end

  private

  def merge(left, right)
    arr = []
    until left.empty? || right.empty?
      if left[0] < right[0]
        arr.push(left.shift)
      else
        arr.push(right.shift)
      end
    end
    arr.concat(left)
    arr.concat(right)
    arr
  end
end
