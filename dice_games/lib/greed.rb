# frozen_string_literal: true

class Greed
  def initialize
    @cumulative_score = 0
  end

  def score(array = nil)
    raise GreedError unless array

    array.each do |value|
      if value == 5
        @cumulative_score += single_score(5)
      elsif value == 1
        @cumulative_score += single_score(1)
      else
        @cumulative_score += 0
      end
    end

    @cumulative_score
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
  def initialize
    @cumulative_score = 0
  end

  def score(array = nil)
    raise GreedError unless array

    array.each do |value|
      if value == 5
        @cumulative_score += five_score
      elsif value == 1
        @cumulative_score += one_score
      else
        @cumulative_score += other_score
      end
    end

    if array == []
      @cumulative_score += other_score
    elsif array == [5]
      @cumulative_score += five_score
    elsif array == [1]
      @cumulative_score += one_score
    else
      @cumulative_score += other_score
    end
    @cumulative_score
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
