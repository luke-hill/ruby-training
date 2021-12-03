# frozen_string_literal: true

class Bottles
  def verse(number)
    "#{verse_intro(number)}\n#{verse_outro(number)}\n"
  end

  def verses(starting_number, ending_number)
    starting_number.downto(ending_number).map { |number| verse(number) }.join("\n") + "\n"
  end

  def sing
    verses(99, 0)
  end

  private

  def verse_intro(number)
    if number == 0
      "#{bottle_amount(number).capitalize} on the wall, #{bottle_amount(number)}."
    elsif number == 1
      "#{bottle_amount(number)} on the wall, #{bottle_amount(number)}."
    else
      "#{bottle_amount(number)} on the wall, #{bottle_amount(number)}."
    end
  end

  def verse_outro(number)
    if number == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    elsif number == 1
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
