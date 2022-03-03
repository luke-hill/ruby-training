# frozen_string_literal: true

class NumberValidator
  attr_reader :values

  def initialize
    @values = []
  end

  def validate(number)
    raise ArgumentError if number.is_a?(String)
    values<<even_odd(number)
    values<<divisible_by_three(number)
    values<<divisible_by_seven(number)
  end

  def even_odd(number)
    if number % 2 != 0
      :odd
    else
      :even
    end
  end

  def divisible_by_three(number)
    if number % 3 ==0
      :divisible_by_three
    else
      :divisible_by_five
    end
  end

  def divisible_by_seven(number)
    if number % 7 == 0
      :divisible_by_seven
    else
      :divisible_by_nine
    end
  end
end
