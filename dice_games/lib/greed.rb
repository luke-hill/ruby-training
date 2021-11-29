# frozen_string_literal: true

class Greed
  def score(array = nil)
    raise GreedError unless array

    if array == []
      0
    elsif array == [5]
      single_score(5)
    elsif array == [1]
      single_score(1)
    else
      0
    end
  end
  
  private

  def single_score(digit)
    if digit == 1
      100
    elsif digit == 5
      50
    else
      0
    end
  end
end

class GreedOther
  def score(array = nil)
    raise GreedError unless array

    if array == []
      other_score
    elsif array == [5]
      five_score
    elsif array == [1]
      one_score
    else
      other_score
    end
  end

  private

  def one_score
    100
  end

  def five_score
    50
  end

  def other_score
    0
  end
end

GreedError = Class.new(ArgumentError)
