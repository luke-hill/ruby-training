# frozen_string_literal: true

module GameOfLife
  # The rules engine in Conway's Game of Life
  class Rules
    def initialize(cell, neighbours)
      @cell = cell
      @neighbours = neighbours
    end

    def rule1
      :TBD
    end

    def rule2
      :TBD
    end

    def rule3
      :TBD
    end

    # The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells,
    # each of which is in one of two possible states, alive or dead.
    #
    # Every cell interacts with its eight neighbours, which are the cells that are
    # horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:
    #
    #                                                                                                                                                                                                                                                                                                                                                  Any live cell with fewer than two live neighbours dies, as if caused by under-population.
    #   Rule1: Any LIVE cell with two or three LIVE neighbours LIVES on to the next generation.
    #
    #   Rule2: Any LIVE cell with more than three LIVE neighbours dies, as if by overcrowding.
    #
    #   Rule3: Any DEAD cell with exactly three LIVE neighbours becomes a LIVE cell, as if by reproduction.
    #
    #   The initial pattern constitutes the seed of the system. The first generation is created
    # by applying the above rules simultaneously to every cell in the seed—births and deaths occur
    # simultaneously, and the discrete moment at which this happens is sometimes called
    # a tick (in other words, each generation is a pure function of the preceding one).
    #
    # The rules continue to be applied repeatedly to create further generations.
  end
end
