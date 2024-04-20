# Algorithms n' Such

* [Advent of Code](https://adventofcode.com/) solutions
* Self-study implementations from the book series _Algorithms Illuminated_ by Tim Roughgarden

![book1](./lib/book1.jpg)
![book2](./lib/book2.jpg)
![book3](./lib/book3.jpg)
![book4](./lib/book4.jpg)

# Example Usage

```bash
# Advent of Code
bundle exec ruby lib/aoc/2015/1_not_quite_lisp.rb

# Algorithms Illuminated
bundle exec rake test
bundle exec rake test TEST=test/algorithms/part1/test_rec_int_mult.rb
bundle exec rake test TEST=test/algorithms/part1/test_rec_int_mult.rb TESTOPS="--name=test_rect_int_mult"
```
