require 'test_helper'
require 'algorithms/part1/rec_int_mult'

class TestRecIntMult < Minitest::Test
  def setup
    @subject = Algorithms::RecIntMult.new
  end

  def test_rect_int_mult
    assert @subject.rec_int_mult(0, 0), 0
    assert @subject.rec_int_mult(1, 2), 2
    assert @subject.rec_int_mult(2, 1), 2
    assert @subject.rec_int_mult(10, 33), 330
    assert @subject.rec_int_mult(1234, 5678), 7_006_652
    assert @subject.rec_int_mult(-1234, 5678), -7_006_652
  end
end
