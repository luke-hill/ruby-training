# frozen_string_literal: true

class Greed
  def score(array = nil)
    raise GreedError unless array

    array.tally.map { |value, quantity| bonus_score(value, quantity) + default_score(value, quantity) }.sum
  end

  private

  def bonus_score(digit, quantity)
    if quantity < 3
      0
    elsif digit == 1
      700
    elsif digit == 5
      350
    else
      100 * digit
    end
  end

  def default_score(digit, quantity)
    if digit == 1
      100 * quantity
    elsif digit == 5
      50 * quantity
    else
      0
    end
  end
end

GreedError = Class.new(ArgumentError)
