# frozen_string_literal: true

require_relative 'grid'
require_relative 'rules'

module GameOfLife
  # The Game of Life Game engine
  class Game
    def grid
      @grid ||= Grid.new(grid_size)
    end

    def grid_size
      10
    end

    def tick
      :TICK
    end
  end
end
