require 'set'
require 'test_helper'
require 'algorithms/part1/closest_pair_prelim'

class TestClosestPairPrelim < Minitest::Test
  def setup
    @subject = Algorithms::ClosestPairPrelim.new
  end

  def test_closest_pair
    points = [[1, 8], [2, 5], [4, 7], [6, 3]]
    assert_equal Set.new([[2, 5], [4, 7]]), Set.new(@subject.closest_pair(points))
  end
end
