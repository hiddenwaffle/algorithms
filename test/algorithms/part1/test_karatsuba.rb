require 'test_helper'
require 'algorithms/part1/karatsuba'

class TestKaratsuba < Minitest::Test
  def setup
    @subject = Algorithms::Karatsuba.new
  end

  def test_rect_int_mult
    assert_equal 0, @subject.karatsuba(0, 0)
    assert_equal 2, @subject.karatsuba(1, 2)
    assert_equal 2, @subject.karatsuba(2, 1)
    assert_equal 330, @subject.karatsuba(10, 33)
    binding.pry
    assert_equal 33330, @subject.karatsuba(10, 3333)
    assert_equal "7_006_652", @subject.karatsuba(1234, 5678)
    assert_equal "-7_006_652", @subject.karatsuba(-1234, 5678)
  end
end
