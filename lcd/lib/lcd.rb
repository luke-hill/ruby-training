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
end
