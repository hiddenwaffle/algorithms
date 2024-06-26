require 'digest'
require_relative '../aoc_2015'

# Examples
# Digest::MD5.hexdigest 'abcdef' + '609043'   # => 000001dbbfa3a5c83a2d506429c7b00e
# Digest::MD5.hexdigest 'pqrstuv' + '1048970' # => 000006136ef2ff3b291c85725f17325c

class AoC::AoC_2015
  def day_4
    secret_key = 'iwrupvqb'
    n = 0
    loop do
      md5 = Digest::MD5.hexdigest("#{secret_key}#{n}")
      if md5.start_with?('00000')
        puts "#{n} - #{md5}"
        break
      end
      n += 1
    end
  end
end

AoC::AoC_2015.new.day_4
