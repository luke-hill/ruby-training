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

class GreedDry
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
