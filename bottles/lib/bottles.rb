# frozen_string_literal: true

class Bottles
  def song
      verses(99,0)
  end

  def verses(arg1, arg2)
    args = *(arg2..arg1)
    x = args.reverse.map { |num| verse(num) }.join
    x << "\n"
  end

  def verse(num)
    "#{line_1(num)}#{line_2(num)}"
  end

  def line_1(num)
    case
      when num > 1
        "#{num} bottles of beer on the wall, #{num} bottles of beer.\n"
      when num == 1
        "1 bottle of beer on the wall, 1 bottle of beer.\n"
      when num == 0
        "No more bottles of beer on the wall, no more bottles of beer.\n"
    end
  end

  def line_2(num)
    case
      when num > 2
        "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
      when num == 2
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      when num == 1
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when num == 0
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
