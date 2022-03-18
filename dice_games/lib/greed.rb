# frozen_string_literal: true

class Greed

  def score(numbers = nil)
    if numbers == nil
      raise GreedError
    elsif numbers == []
      0
    elsif numbers.length == 1
      simple_scoring(numbers[0])
    elsif numbers.length == 3
      triple_scoring(numbers[0])
    else
      range_scoring(numbers)
    end
  end

  def simple_scoring(value)
    return 100 if value == 1
    return 50 if value == 5
    return 0 if value == 2 || value == 3 || value == 4 || value == 6
  end

  def triple_scoring(value)
    return 1000 if value == 1
    return value * 100
  end

  def range_scoring(arr)
    if arr.uniq.length == arr.length
      unique_scoring(arr)
    else
      medium_high_scoring(arr)
    end
  end

  def unique_scoring(value)
    total_score = 0
    value.map { |item| total_score += simple_scoring(item) }
    return total_score
  end

  def medium_high_scoring(arr)
    total_score = 0
    myHash  = arr.tally #=> { 4 => 4, 5 => 1 }
    myHash.each {|number, occurrence|
      while occurrence >= 3
        total_score += triple_scoring(number)
        occurrence -= 3
      end
      while occurrence > 0 && occurrence < 3
        total_score += simple_scoring(number)
        occurrence -= 1
      end
    }
    return total_score
  end
end

class GreedError < StandardError
end
