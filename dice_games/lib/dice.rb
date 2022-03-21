# frozen_string_literal: true

class Dice
  attr_reader :values

  def roll(number = 1)
    @values = []
    (number).times { |roll| @values << rand(1..6) }
    @values
  end
end
