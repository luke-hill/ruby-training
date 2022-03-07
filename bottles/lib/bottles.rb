# frozen_string_literal: true

class Bottles
  def verse(number)
    case number
    when 8
    "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n"
    when 3
      "3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n"
    end
  end
end
