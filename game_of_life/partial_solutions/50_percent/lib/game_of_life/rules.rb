# frozen_string_literal: true

module GameOfLife
  # The rules engine in Conway's Game of Life
  class Rules
    attr_reader :cell, :neighbours
    private :cell, :neighbours

    def initialize(cell, neighbours)
      @cell = cell
      @neighbours = neighbours
    end

    def survival
      cell.alive? && alive_neighbours.between?(2, 3)
    end

    def reproduction
      cell.dead? && alive_neighbours == 3
    end

    private

    def alive_neighbours
      neighbours.count(&:alive?)
    end
  end
end
