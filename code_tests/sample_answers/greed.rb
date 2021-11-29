# frozen_string_literal: true

class Greed
  def score(array = nil)
    raise GreedError unless array

    array.tally.map { |value, quantity| score_amount(value, quantity) }.sum
  end

  private

  def score_amount(digit, quantity)
    if quantity >= 3
      enhanced_score(digit, quantity)
    else
      regular_score(digit, quantity)
    end
  end

  def enhanced_score(digit, quantity)
    if digit == 1
      1000 + (quantity - 3) * 100
    elsif digit == 5
      500 + (quantity - 3) * 50
    else
      100 * digit
    end
  end

  def regular_score(digit, quantity)
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
