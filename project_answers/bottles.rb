# frozen_string_literal: true

class Bottles
  def verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end
end
