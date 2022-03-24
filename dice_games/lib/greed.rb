# frozen_string_literal: true

class Greed
  def score(dice)
    score= 0
    dice.uniq.each do |number|
      if number == 1
        if dice.count(1) >= 3
          score += 1000
          score += 100 * (dice.count(1) - 4)
        else
          score += 100 * dice.count(1)
        end
      end

      if number == 5
        if dice.count(5) >= 3
          score += 5  * 100
          score += 50 * (dice.count(5) - 3)
        else
          score += 50 * dice.count(5)
        end
      else
        score += number * 100 if dice.count(number) >= 3
      end

    end
    score
  end
  end











