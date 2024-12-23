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

    def neighbours(x, y)
      [
        top_left_neighbour(x, y), top_neighbour(x, y), top_right_neighbour(x, y),
        left_neighbour(x, y), right_neighbour(x, y),
        bottom_left_neighbour(x, y), bottom_neighbour(x, y), bottom_right_neighbour(x, y)
      ].compact
    end

    def top_left_neighbour(x, y)
      return nil if y.zero? || x.zero?

      cell_at(x - 1, y - 1)
    end

    def top_neighbour(x, y)
      return nil if y.zero?

      cell_at(x, y - 1)
    end

    def top_right_neighbour(x, y)
      return nil if y.zero? || x == grid_size

      cell_at(x + 1, y - 1)
    end

    def left_neighbour(x, y)
      return nil if x.zero?

      cell_at(x - 1, y)
    end

    def right_neighbour(x, y)
      return nil if x == grid_size

      cell_at(x + 1, y)
    end

    def bottom_left_neighbour(x, y)
      return nil if y == grid_size || x.zero?

      cell_at(x - 1, y + 1)
    end

    def bottom_neighbour(x, y)
      return nil if y == grid_size

      cell_at(x, y + 1)
    end

    def bottom_right_neighbour(x, y)
      return nil if y == grid_size || x == grid_size

      cell_at(x + 1, y + 1)
    end
  end
end
