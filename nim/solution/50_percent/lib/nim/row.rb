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

    def value_too_big?
      value > 9
    end

    def stick_display
      if value_too_big?
        '| | |...| | | '
      else
        '| ' * value
      end
    end

    def padding
      ' ' * (20 - value * 2)
    end

    def number_display
      "(#{value})"
    end
  end
end
