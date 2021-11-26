# frozen_string_literal: true

class Dice
  def roll(amount = 1)
    array = []
    amount.times { |i| array << i }
    @values = array
  end

  def values
    @values
  end
end
