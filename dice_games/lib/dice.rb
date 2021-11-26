# frozen_string_literal: true

class Dice
  def roll(amount = 1)
    @values = []
    amount.times { |i| @values << i }
    @values
  end

  def values
    @values
  end
end
