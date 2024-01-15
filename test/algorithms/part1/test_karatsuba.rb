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
    assert_equal 1000, @subject.karatsuba(10, 100)
    assert_equal 7_006_652, @subject.karatsuba(1234, 5678)
    assert_equal -7_006_652, @subject.karatsuba(-1234, 5678)
    # Challenge problem from the website
    assert_equal 853973422267356706546355086954657447066477805411654748981814531384238681327848992425532501942675408,
                @subject.karatsuba(
                  3141592653589793238462643383279502884197169399375105820974944592,
                  271828182845904523536028747135266249
                )
  end
end
