# frozen_string_literal: true

class Bottles
  def verses(start_verse, end_verse)
    total_verses = (start_verse..end_verse)
    
  end

  def verse(number)
    "#{line_1(number)}#{line_2(number)}"
  end

  def line_1(number)
    if number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n"
    elsif number == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n"
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
    end
  end

  def line_2(number)
    if number == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif number == 2
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif number == 1
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    end
  end
end
