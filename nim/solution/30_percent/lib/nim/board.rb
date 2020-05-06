# frozen_string_literal: true

require 'nim/row'

module Nim
  class Board
    attr_reader :rows, :active_player

    def initialize(number_of_rows = 5, active_player: :player_one)
      @rows = Array.new(number_of_rows) { Row.new }
      @active_player = active_player
    end

    def prompt
      "#{active_player}: it is your turn."
    end
  end
end
