# frozen_string_literal: true

class LCD
  attr_reader :number_or_string

  def initialize(number_or_string)
    @number_or_string = number_or_string
  end

  def render

  end


  def horizontal_segment(type)
    case type
    when 1
      "_"
    else
      " "
    end
  end

  def vertical_segment(type)
    case type
    when 1
      "|"
    else
      " "
    end
  end

  def lcd_display
    {
      0 => [1, 1, 0, 1, 1, 1, 1],
      1 => [0, 0, 0, 1, 0, 0, 1],
      2 => [1, 0, 1, 1, 1, 1, 0],
      3 => [1, 0, 1, 1, 0, 1, 1],
      4 => [0, 1, 1, 1, 0, 0, 1],
      5 => [1, 1, 1, 0, 0, 1, 1],
      6 => [1, 1, 1, 0, 1, 1, 1],
      7 => [1, 0, 0, 1, 0, 0, 1],
      8 => [1, 1, 1, 1, 1, 1, 1],
      9 => [1, 1, 1, 1, 0, 1, 1],
      "a" => [1, 1, 1, 1, 1, 0, 1],
      "c" => [1, 1, 0, 0, 1, 1, 0],
      "b" => [0, 1, 1, 0, 1, 1, 1],
      "f" => [1, 1, 1, 0, 1, 0, 0],
      "e" => [1, 1, 1, 0, 1, 1, 0],
      "d" => [0, 0, 1, 1, 1, 1, 1]
    }
  end
end
