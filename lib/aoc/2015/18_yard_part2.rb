require_relative '../aoc_2015'

EXAMPLE_BOARD_SIZE = 6
EXAMPLE = <<~EOF
  ##.#.#
  ...##.
  #....#
  ..#...
  #.#..#
  ####.#
EOF
EXAMPLE_STEPS = 5

class AoC::AoC_2015
  BOARD_SIZE = 100
  INPUT = File.read("#{__dir__}/18_yard.input")
  STEPS = 100

  def day_18
    board = parse_board
    STEPS.times do
      board = step(board)
      # puts '-----------------------------------------------------------------------------'
      # pp board
    end
    puts "Count: #{count_on(board)}"
  end

  private

  def parse_board
    board = create_board
    INPUT.lines.each.with_index do |line, row|
      chars = line.strip.chars
      chars.each.with_index do |char, col|
        board[row][col] = char
      end
    end
    board
  end

  def create_board
    Array.new(BOARD_SIZE) { |row| row = Array.new(BOARD_SIZE) }
  end

  def step(board)
    next_board = create_board
    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        neighbors_count = count_neighbors(board, row, col)
        cell = board[row][col]
        if cell == '#' # on
          if neighbors_count == 2 || neighbors_count == 3
            next_board[row][col] = '#'
          else
            next_board[row][col] = '.'
          end
        elsif cell == '.'
          if neighbors_count == 3
            next_board[row][col] = '#'
          else
            next_board[row][col] = '.'
          end
        else
          raise 'wtf'
        end
      end
    end
    next_board[0][0] = next_board[0][BOARD_SIZE-1] = next_board[BOARD_SIZE-1][0] = next_board[BOARD_SIZE-1][BOARD_SIZE-1] = '#'
    next_board
  end

  def count_neighbors(board, row, col)
    neighbors = [
      cell_at(board, row-1, col-1), # northwest
      cell_at(board, row-1, col  ), # north
      cell_at(board, row-1, col+1), # northeast
      cell_at(board, row  , col-1), # west
      cell_at(board, row  , col+1), # east
      cell_at(board, row+1, col-1), # southwest
      cell_at(board, row+1, col  ), # south
      cell_at(board, row+1, col+1)  # southeast
    ]
    neighbors.filter { |neighbor| neighbor == '#' }.count
  end

  def cell_at(board, row, col)
    return nil if row < 0 || row >= BOARD_SIZE || col < 0 || col >= BOARD_SIZE
    board[row][col]
  end

  def count_on(board)
    count = 0
    BOARD_SIZE.times do |row|
      BOARD_SIZE.times do |col|
        if board[row][col] == '#'
          count += 1
        end
      end
    end
    count
  end
end

AoC::AoC_2015.new.day_18
