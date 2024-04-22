require_relative '../aoc_2015'

class AoC::AoC_2015
  WIDTH = 1000
  HEIGHT = 1000

  def day_6_part_2
    lights = []
    HEIGHT.times do |row|
      lights[row] = []
      WIDTH.times do |col|
        lights[row][col] = 0
      end
    end
    input = File.read(__dir__ + '/6_fire.input')
    input.lines do |line|
      command, x1, y1, x2, y2 = parse_line(line)
      switch(lights, command, y1, x1, y2, x2)
    end
    puts lights.flatten.reduce { |acc, n| acc += n }
  end

  private

  def parse_line(line)
    match_data = line.match(/([a-z ]+) (\d+),(\d+) through (\d+),(\d+)/)
    [
      match_data[1],
      match_data[2].to_i,
      match_data[3].to_i,
      match_data[4].to_i,
      match_data[5].to_i
    ]
  end

  def switch(lights, command, row1, col1, row2, col2)
    row_times = row2 - row1 + 1
    col_times = col2 - col1 + 1
    row_times.times do |row|
      col_times.times do |col|
        case command
        when 'turn on'
          lights[row + row1][col + col1] += 1
        when 'turn off'
          lights[row + row1][col + col1] -= 1
          lights[row + row1][col + col1] = 0 if lights[row + row1][col + col1] < 0
        when 'toggle'
          lights[row + row1][col + col1] += 2
        end
      end
    end
  end
end

AoC::AoC_2015.new.day_6_part_2
