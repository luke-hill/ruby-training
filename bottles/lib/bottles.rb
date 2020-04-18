# frozen_string_literal: true

class Bottles
  def verse(beers)
    number = beers
    if number == 0
      verse = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif number == 2
      verse = "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif number == 1
      verse = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    else
      verse =   "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    end
  end
end
