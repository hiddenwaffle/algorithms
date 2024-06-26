require 'test_helper'
require 'algorithms/part1/count_inversions'

class TestCountInversions < Minitest::Test
  def setup
    @subject = Algorithms::CountInversions.new
  end

  def test_sort_and_count_inv
    arr = [1, 2]
    assert_equal [arr.sort, 0], @subject.sort_and_count_inv(arr)
    arr = [1, 3, 5, 2, 4, 6, 7, 8]
    assert_equal [arr.sort, 3], @subject.sort_and_count_inv(arr)
    arr = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal [arr.sort, 0], @subject.sort_and_count_inv(arr)
    arr = [8, 7, 6, 5, 4, 3, 2, 1]
    assert_equal [arr.sort, 28], @subject.sort_and_count_inv(arr)
  end
end
