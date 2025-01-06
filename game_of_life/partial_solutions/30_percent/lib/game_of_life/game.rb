# frozen_string_literal: true

require_relative 'cell'

module GameOfLife
  # The Game of Life Game board
  class Game
    attr_reader :cells

    def initialize
      @cells = Array.new(grid_size) { Array.new(grid_size) { Cell.new } }
    end

    def cell_at(x, y)
      cells[y][x]
    end

    def grid_size
      10
    end

    def top_left_neighbour(x, y)
      return nil if y.zero? || x.zero?

      cells[y - 1][x - 1]
    end

    def top_neighbour(x, y)
      return nil if y.zero?

      cells[y - 1][x]
    end

    def top_right_neighbour(x, y)
      return nil if y.zero? || x == grid_size

      cells[y - 1][x + 1]
    end

    def left_neighbour(x, y)
      return nil if x.zero?

      cells[y][x - 1]
    end

    def right_neighbour(x, y)
      return nil if x == grid_size

      cells[y][x + 1]
    end

    def bottom_left_neighbour(x, y)
      return nil if y == grid_size || x.zero?

      cells[y + 1][x - 1]
    end

    def bottom_neighbour(x, y)
      return nil if y == grid_size

      cells[y + 1][x]
    end

    def bottom_right_neighbour(x, y)
      return nil if y == grid_size || x == grid_size

      cells[y + 1][x + 1]
    end
  end
end
