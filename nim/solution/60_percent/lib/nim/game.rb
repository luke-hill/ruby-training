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

    def take_turn
      Turn.new(active_player, inactive_player, board).perform
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
      @player_one ||= begin
        puts 'Enter Player One Name:'
        user_input
      end
    end

    def player_two
      @player_two ||= begin
        puts 'Enter Player Two Name:'
        user_input
      end
    end

    def user_input
      gets.chomp
    end

    def store_player_data
      self.active_player = player_one
      self.inactive_player = player_two
      self.players = [player_one, player_two]
      puts "Active player is: #{active_player}"
      puts "Inactive player is: #{inactive_player}"
    end

    def value_of(row)
      board.rows[row - 1].value
    end

    def remove_from(row, amount)
      board.rows[row - 1].value -= amount
    end

    def switch_players
      self.active_player, self.inactive_player = self.inactive_player, self.active_player
    end
  end
end

class GameSetupError < ArgumentError; end
