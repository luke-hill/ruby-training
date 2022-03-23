# frozen_string_literal: true

class Greed
  def score(dice)
    score = 0
    dice.each do |die|
      if die == 5
        score += 50
      elsif die== 1
        score += 100
      elsif
        0
      end
    end
    score
  end
end



