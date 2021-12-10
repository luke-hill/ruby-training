# frozen_string_literal: true

# This uses the value on the die as the primary determinant
class Greed
  def score(array = nil)
    raise GreedError unless array

    array.tally.map { |value, quantity| score_amount(value, quantity) }.sum
  end

  private

  def score_amount(digit, quantity)
    return one_score(quantity) if digit == 1
    return five_score(quantity) if digit == 5
    other_score(digit, quantity)
  end

  def one_score(quantity)
    if quantity >= 3
      1000 + (quantity - 3) * 100
    else
      100 * quantity
    end
  end

  def five_score(quantity)
    if quantity >= 3
      500 + (quantity - 3) * 50
    else
      50 * quantity
    end
  end

  def other_score(value, quantity)
    return 100 * value if quantity >= 3

    0
  end
end

GreedError = Class.new(ArgumentError)
