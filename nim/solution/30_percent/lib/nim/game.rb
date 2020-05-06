# frozen_string_literal: true

require 'nim/board'

module Nim
  class Game
    attr_accessor :active_player, :board

    def start
      player_one = determine_player_one_name
      player_two = determine_player_two_name

      if invalid_players?(player_one, player_two)
        raise GameSetupError
      end

      self.active_player = :player_one
      self.board = Board.new
    end

    private

    def determine_player_one_name
      gets.chomp
    end
    alias determine_player_two_name determine_player_one_name

    def invalid_players?(player_one, player_two)
      player_one.empty? ||
        player_two.empty? ||
        player_one == player_two
    end
  end
end

class GameSetupError < ArgumentError; end
