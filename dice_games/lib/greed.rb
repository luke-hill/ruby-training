# frozen_string_literal: true

class Greed
  def score(dice)
    score= 0
    dice.uniq.each do |number|
      if number == 1
        if dice.count(1) >= 3
          score += 1000
          score += 100 * (dice.count(1) - 3)
        else
          score += 100 * dice.count(1)
        end
      end

      if number == 5
        if dice.count(5) >= 3
          score += 5  * 100
        end
        end


    end
    score
  end
  end











