# frozen_string_literal: true

module GameOfLife
  # A single cell in Conway's Game of Life
  class Cell
    # All cells start as alive
    def initialize(x, y)
      @state = :alive
      @x = x
      @y = y
    end

    # Is the cell alive?
    def alive?
      @state == :alive
    end

    # Set the cell to be alive no matter what (After a tick)
    def alive!
      @state = :alive
    end

    # Is the cell dead?
    def dead?
      !alive?
    end

    # Set the cell to be dead no matter what (After a tick)
    def dead!
      @state = :dead
    end

    # Render the cell in the console or on a grid in an appropriate way
    def inspect
      if alive?
        alive_emoji
      else
        dead_emoji
      end
    end

    private

    def alive_emoji
      "\u{1f642}"
    end

    def dead_emoji
      "\u{1f480}"
    end
  end
end
