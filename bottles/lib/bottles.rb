# frozen_string_literal: true

class Bottles
  def sing
    verses(99,0)
  end

  def verses(upper,lower)
    upper.downto(lower).map {|number| verse(number)}.join("\n")+ "\n"
  end

  def container(number)
    case number
    when 1
      "bottle"
    else
      "bottles"
    end
  end

  def verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "#{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.\nTake one down and pass it around, #{number-1} #{container(number-1)} of beer on the wall.\n"
    end
  end
  end



