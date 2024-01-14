require 'test_helper'
require 'algorithms/part1/merge_sort'

class TestMergeSort < Minitest::Test
  def setup
    @subject = Algorithms::MergeSort.new
  end

  def test_merge_sort
    assert_equal [1, 2, 3, 4], @subject.merge_sort([3, 2, 4, 1])
  end
end
