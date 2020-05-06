# frozen_string_literal: true

require_relative 'board'

module Nim
  # Nim::Turn
  # The class that controls the taking turn action and updating various items
  class Turn
    attr_accessor :active_player,
                  :board,
                  :inactive_player

    def initialize(active_player, inactive_player, board)
      @active_player = active_player
      @inactive_player = inactive_player
      @board = board
    end

    def perform
      puts "#{active_player} it is your turn."
      puts "Which row do you want to act on? (Type the row number)"
      puts "You have selected row #{row}. This row has a value of #{value_of(row)}"
      puts "How many items do you wish to remove? (Type the amount)"
      puts "Removing #{amount} from row #{row}"
      remove_from(row, amount)
      puts "Row #{row}, now has a value of #{value_of(row)}"
      puts "#{active_player} your turn is now over."
      switch_players
      puts "#{active_player} it is now your turn."
    end

    private

    def row
      @row ||= gets.chomp.to_i
    end

    def amount
      @amount ||= gets.chomp.to_i
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
