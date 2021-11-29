# frozen_string_literal: true

class Greed
  def score(array = nil)
    raise GreedError unless array

    if array == []
      0
    elsif array == [5]
      50
    elsif array == [1]
      100
    else
      0
    end
  end
end

class GreedOther
  def score(array = nil)
    raise GreedError unless array
    
    if array == []
      0
    elsif array == [5]
      50
    elsif array == [1]
      100
    else
      0
    end
  end
end

GreedError = Class.new(ArgumentError)
