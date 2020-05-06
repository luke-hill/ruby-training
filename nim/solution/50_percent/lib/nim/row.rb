# frozen_string_literal: true

module Nim
  # Nim::Row
  # This contains the elements that will be reduced (or eliminated), during
  # the players playing the game
  class Row
    attr_accessor :value

    def initialize(value)
      @value = value
    end

    def display
      "#{stick_display}#{padding}#{number_display}"
    end

    private

    def stick_display
      '| ' * value
    end

    def padding
      ' ' * 20
    end

    def number_display
      "(#{value})"
    end
  end
end
