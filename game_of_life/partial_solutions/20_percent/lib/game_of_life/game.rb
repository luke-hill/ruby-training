# frozen_string_literal: true

require_relative 'cell'

module GameOfLife
  # The Game of Life Game board
  class Game
    attr_reader :cells

    def initialize
      @cells = Array.new(10) { Array.new(10) { Cell.new } }
    end

    def cell_at(x, y)
      cells[y][x]
    end

    def left_neighbour(x, y)
      return nil if x.zero?

      cells[y][x - 1]
    end
  end
end
