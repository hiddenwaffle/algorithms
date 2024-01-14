require 'test_helper'
require 'algorithms/part1/rec_int_mult'

class TestRecIntMult < Minitest::Test
  def setup
    @subject = Algorithms::RecIntMult.new
  end

  def test_rect_int_mult
    assert_equal 0, @subject.rec_int_mult(0, 0)
    assert_equal 2, @subject.rec_int_mult(1, 2)
    assert_equal 2, @subject.rec_int_mult(2, 1)
    assert_equal 330, @subject.rec_int_mult(10, 33)
    assert_equal 33330, @subject.rec_int_mult(10, 3333)
    assert_equal 7_006_652, @subject.rec_int_mult(1234, 5678)
    assert_equal -7_006_652, @subject.rec_int_mult(-1234, 5678)
  end
end
