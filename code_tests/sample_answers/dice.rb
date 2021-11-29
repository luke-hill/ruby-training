# frozen_string_literal: true

class Dice
  attr_reader :values

  def roll(amount = 1)
    @values = amount.times.map { rand(1..6) }
  end
end
