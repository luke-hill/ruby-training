# frozen_string_literal: true

class NumberValidator
  def validate(number)
    if number % 2 != 0
      [:odd]
    else
      [:even]
    end

  end
end
