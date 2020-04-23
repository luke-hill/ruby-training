# frozen_string_literal: true

class Bottles
  def verse(argument)
    case argument
    when 3..99
      "#{argument} bottles of beer on the wall, #{argument} bottles of beer.\nTake one down and pass it around, #{argument-1} bottles of beer on the wall.\n"
    when 2
      "2 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, 1 bottle of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end
end
