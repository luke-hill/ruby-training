# frozen_string_literal: true

class Bottles
  def verse(number)
    if number == 1
      "#{bottle_amount(number)} on the wall, #{bottle_amount(number)}.\nTake it down and pass it around, #{bottle_amount(number - 1)} on the wall.\n"
    else
      "#{bottle_amount(number)} on the wall, #{bottle_amount(number)}.\nTake one down and pass it around, #{bottle_amount(number - 1)} on the wall.\n"
    end
  end

  private

  def bottle_amount(number)
    if number == 0
      "no more bottles of beer"
    elsif number == 1
      "1 bottle of beer"
    else
      "#{number} bottles of beer"
    end
  end
end
