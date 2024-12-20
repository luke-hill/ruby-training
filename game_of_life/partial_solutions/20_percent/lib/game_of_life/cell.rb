# frozen_string_literal: true

module GameOfLife
  # A single cell in Conway's Game of Life
  class Cell
    attr_reader :state

    # All cells start as alive for now
    def initialize
      @state = :alive
    end

    def alive?
      state == :alive
    end

    def dead?
      !alive?
    end
  end
end
