require 'test_helper'
require 'algorithms/part1/karatsuba'

class TestKaratsuba < Minitest::Test
  def setup
    @subject = Algorithms::Karatsuba.new
  end

  def test_rect_int_mult
    assert @subject.karatsuba(0, 0), 0
    assert @subject.karatsuba(1, 2), 2
    assert @subject.karatsuba(2, 1), 2
    assert @subject.karatsuba(10, 33), 330
    assert @subject.karatsuba(1234, 5678), 7_006_652
    assert @subject.karatsuba(-1234, 5678), -7_006_652
  end
end
