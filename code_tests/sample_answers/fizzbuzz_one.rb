# frozen_string_literal: true

class Fizzbuzz
  def play(n)
    1.upto(n).map do |value|
      if (value % 15).zero?
        "fizzbuzz"
      elsif (value % 3).zero?
        "fizz"
      elsif (value % 5).zero?
        "buzz"
      else
        value
      end
    end
  end
end
