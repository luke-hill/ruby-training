# frozen_string_literal: true

class NumberValidator
  attr_reader :values

  def initialize
    @values = []
  end

  def validate(number)
    values<<even_odd(number)
  end

  def even_odd(number)
    if number % 2 != 0
      :odd
    else
      :even
    end
  end
end
