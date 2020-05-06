# frozen_string_literal: true

require_relative 'board'

module Nim
  # Nim::Game
  # The class that controls the overall game. Running the `#start` protocol
  class Game
    attr_accessor :active_player,
                  :board,
                  :inactive_player,
                  :players

    def start
      validate_player_names
      store_player_data

      self.board = Board.new(active_player: active_player)
    end

    private

    def validate_player_names
      raise GameSetupError if invalid_players?
    end

    def invalid_players?
      player_one.empty? ||
        player_two.empty? ||
        player_one == player_two
    end

    def player_one
      @player_one ||= determine_player_name
    end

    def player_two
      @player_two ||= determine_player_name
    end

    def determine_player_name
      gets.chomp
    end

    def store_player_data
      self.active_player = player_one
      self.inactive_player = player_two
      self.players = [player_one, player_two]
    end
  end
end

class GameSetupError < ArgumentError; end
