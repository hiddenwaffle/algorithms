require 'test_helper'
require 'algorithms/part1/rec_mat_mult'

class TestRecMatMult < Minitest::Test
  def setup
    @subject = Algorithms::RecMatMult.new
  end

  def test_rect_int_mult
    a = [
      [1, 2],
      [3, 4]
    ]
    b = [
      [5, 6],
      [7, 8]
    ]
    c = [
      [19, 22],
      [43, 50]
    ]
    assert_equal c, @subject.rec_mat_mult(a, b)
  end
end
