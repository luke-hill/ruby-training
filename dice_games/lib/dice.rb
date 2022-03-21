# frozen_string_literal: true

class Dice
  attr_reader :values

  def roll(number)
    @values = []
    (number).times { |roll| @values << rand(1..6) }
    @values
  end
end
