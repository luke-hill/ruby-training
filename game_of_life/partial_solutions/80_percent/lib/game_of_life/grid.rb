# frozen_string_literal: true

require_relative 'cell'
require_relative 'rules'

module GameOfLife
  # The Game of Life grid of cells
  class Grid
    attr_reader :cells, :grid_size

    def initialize(grid_size)
      @grid_size = grid_size
      @cells = Array.new(grid_size) { |y| Array.new(grid_size) { |x| Cell.new(x, y) } }
    end

    def neighbours(x, y)
      [
        top_left_neighbour(x, y), top_neighbour(x, y), top_right_neighbour(x, y),
        left_neighbour(x, y), right_neighbour(x, y),
        bottom_left_neighbour(x, y), bottom_neighbour(x, y), bottom_right_neighbour(x, y)
      ].compact
    end

    def next_state
      new_grid = Array.new(grid_size) do |y|
        Array.new(grid_size) do |x|
          previous_cell = cell_at(x, y)
          previous_neighbours = neighbours(x, y)
          engine = Rules.new(previous_cell, previous_neighbours)
          _to_become_alive = engine.become_alive?

          Cell.new(x, y).tap { |cell| cell.dead! unless _to_become_alive }
        end
      end
      @cells = new_grid
    end

    def seed(proportion_of_alive_cells)
      cells.map! do |row|
        row.map! do |cell|
          cell.dead! if rand > proportion_of_alive_cells
        end
      end
    end

    private

    def top_left_neighbour(x, y)
      return nil if y.zero? || x.zero?

      cell_at(x - 1, y - 1)
    end

    def top_neighbour(x, y)
      return nil if y.zero?

      cell_at(x, y - 1)
    end

    def top_right_neighbour(x, y)
      return nil if y.zero? || x == max_index

      cell_at(x + 1, y - 1)
    end

    def left_neighbour(x, y)
      return nil if x.zero?

      cell_at(x - 1, y)
    end

    def right_neighbour(x, y)
      return nil if x == max_index

      cell_at(x + 1, y)
    end

    def bottom_left_neighbour(x, y)
      return nil if y == max_index || x.zero?

      cell_at(x - 1, y + 1)
    end

    def bottom_neighbour(x, y)
      return nil if y == max_index

      cell_at(x, y + 1)
    end

    def bottom_right_neighbour(x, y)
      return nil if y == max_index || x == max_index

      cell_at(x + 1, y + 1)
    end

    def cell_at(x, y)
      cells[y][x]
    end

    def max_index
      cells.length - 1
    end
  end
end
