require 'digest'
require_relative '../aoc_2015'

class AoC::AoC_2015
  def day_4
    secret_key = 'iwrupvqb'
    n = 0
    loop do
      md5 = Digest::MD5.hexdigest("#{secret_key}#{n}")
      if md5.start_with?('000000')
        puts "#{n} - #{md5}"
        break
      end
      n += 1
    end
  end
end

AoC::AoC_2015.new.day_4
