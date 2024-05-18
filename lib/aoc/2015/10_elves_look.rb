require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_10
    input = 1321131112
    50.times do
      input = look_and_say(input)
    end
    puts input.to_s.length
  end

  private

  def look_and_say(n)
    buckets = group(n)
    arr = buckets.flat_map do |bucket|
      count = bucket.size
      [count.to_s, bucket[0]]
    end
    arr.join.to_i
  end

  def group(n)
    chars = n.to_s.chars
    buckets = []
    bucket = [chars[0]]
    (1..chars.length).each do |i|
      current = chars[i]
      previous = chars[i-1]
      if current != previous
        buckets << bucket
        bucket = [current]
      else
        bucket << current
      end
    end
    buckets
  end
end

AoC::AoC_2015.new.day_10
