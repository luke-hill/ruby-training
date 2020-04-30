# frozen_string_literal: true

# 66 bytes - Code golf
class Fizzbuzz
  def play(n)
    1.upto(n).map{|v|v%15==0?'fizzbuzz':v%5==0?'buzz':v%3==0?'fizz':v}
  end
end
