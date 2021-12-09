# frozen_string_literal: true

class NumberValidator
  def validate(number)
    if number.even?
      [:even]
    else
      [:odd]
    end
  end
end
