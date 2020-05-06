# frozen_string_literal: true

module Nim
  class Game
    attr_accessor :active_player

    def start
      player_one = determine_player_one_name
      player_two = determine_player_two_name

      if invalid_players?(player_one, player_two)
        raise GameSetupError
      end
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
