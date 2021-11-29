# frozen_string_literal: true

class Greed
  def initialize
    @cumulative_score = 0
  end

  def score(array = nil)
    raise GreedError unless array

    array.tally.each do |value, quantity|
      if quantity == 3
        @cumulative_score += triple_score(value)
      else
        @cumulative_score += regular_score(value, quantity)
      end
    end

    @cumulative_score
  end

  private

  def triple_score(digit)
    if digit == 1
      1000
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

class GreedOther
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
    return 1000 if quantity == 3

    100 * quantity
  end

  def five_score(quantity)
    return 500 if quantity == 3

    50 * quantity
  end

  def other_score(value, quantity)
    return 100 * value if quantity == 3

    0
  end
end

GreedError = Class.new(ArgumentError)
