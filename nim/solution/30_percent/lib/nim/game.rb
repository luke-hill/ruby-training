# frozen_string_literal: true

require 'nim/board'

module Nim
  # Nim::Game
  # The class that controls the overall game. Running the `#start` protocol
  class Game
    attr_accessor :active_player, :board

    def start
      if invalid_players?(determine_player_name, determine_player_name)
        raise GameSetupError
      end

      self.active_player = :player_one
      self.board = Board.new(active_player: active_player)
    end

    private

    def determine_player_name
      gets.chomp
    end

    def invalid_players?(player_one, player_two)
      player_one.empty? ||
        player_two.empty? ||
        player_one == player_two
    end
  end
end

class GameSetupError < ArgumentError; end
