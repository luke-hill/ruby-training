# frozen_string_literal: true

class Greed
  def score(array = nil)
    raise GreedError unless array
  end
end

class GreedOther
  def score(array = nil)
    raise GreedError unless array
  end
end

GreedError = Class.new(ArgumentError)
