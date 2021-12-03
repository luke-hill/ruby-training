# frozen_string_literal: true

class Bottles
  def verse(number)
    if number == 1
      "#{verse_intro(number)}\n#{verse_outro(number)}\n"
    else
      "#{verse_intro(number)}\n#{verse_outro(number)}\n"
    end
  end

  private

  def verse_intro(number)
    if number == 1
      "#{bottle_amount(number)} on the wall, #{bottle_amount(number)}."
    else
      "#{bottle_amount(number)} on the wall, #{bottle_amount(number)}."
    end
  end

  def verse_outro(number)
    if number == 1
      "Take it down and pass it around, #{bottle_amount(number - 1)} on the wall."
    else
      "Take one down and pass it around, #{bottle_amount(number - 1)} on the wall."
    end
  end

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
