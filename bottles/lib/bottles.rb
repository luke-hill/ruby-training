# frozen_string_literal: true

class Bottles
  def song
      verses(99,0)
  end

  def verses(arg1,arg2)
    args = [*arg1..arg2]
    args.each do |arg1|
      verse(arg1)
    end
  end

  def verse(arg1)
      case
        when arg1 > 2
          "#{arg1} bottles of beer on the wall, #{arg1} bottles of beer.\nTake one down and pass it around, #{arg1-1} bottles of beer on the wall.\n"
        when arg1 == 2
          "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
        when arg1 == 1
          "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
        when arg1 == 0
          "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
  end
end
