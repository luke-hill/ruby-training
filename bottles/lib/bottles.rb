# frozen_string_literal: true

class Bottles
  def verse(arg1,arg2= :default)
    if arg2 == :default
      arg2 = arg1
    else
    end

    verses = [*arg1..arg2]
    verses.each do |verse|
      case verse
      when 3..99
        "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\nTake one down and pass it around, #{verse-1} bottles of beer on the wall.\n"
      when 2
        "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
      when 1
        "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
      when 0
        "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
  end
end
