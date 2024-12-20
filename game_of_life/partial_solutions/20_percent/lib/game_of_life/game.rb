# frozen_string_literal: true

require_relative 'cell'

module GameOfLife
  # The Game of Life Game board
  class Game
    attr_reader :cells

    def initialize
      @cells = Array.new(10) { Array.new(10) { Cell.new } }
    end
  end
end
