require 'test_helper'
require 'algorithms/part1/rec_mat_mult'

class TestRecMatMult < Minitest::Test
  def setup
    @subject = Algorithms::RecMatMult.new
  end

  def test_rect_int_mult_2x2
    a = [[1, 2], [3, 4]]
    b = [[5, 6], [7, 8]]
    c = [[19, 22], [43, 50]]
    assert_equal c, @subject.rec_mat_mult(a, b)
  end

  def test_rect_int_mult_4x4
    a = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16]
    ]
    b = [
      [17, 18, 19, 20],
      [21, 22, 23, 24],
      [25, 26, 27, 28],
      [29, 30, 31, 32]
    ]
    c = [
      [250, 260, 270, 280],
      [618, 644, 670, 696],
      [986, 1028, 1070, 1112],
      [1354, 1412, 1470, 1528]
    ]
    assert_equal c, @subject.rec_mat_mult(a, b)
  end
end
