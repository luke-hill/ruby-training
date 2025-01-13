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
      # Step 1 - Go into grid and generate next state
      # Step 2 - When inside grid, iterate every cell for next state
      # Step 3 - Tick should perform the update across every element simultaneously
      # Step 4 - Sleep then show some progress
      :TICK
    end
  end
end
