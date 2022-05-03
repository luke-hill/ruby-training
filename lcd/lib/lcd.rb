# frozen_string_literal: true

class LCD
  attr_reader :digits

  def initialize(digit)
    @digits = digit
  end

  def render
    render_lcd(digits)
  end

  def space
    " "
  end

  def underscore
    "_"
  end

  def newline
    "\n"
  end

  def pipe
    "|"
  end

  def render_lcd(items)
    # convert string or numbers into array & iterate through it
    array = []
    if items.is_a?(Integer)
      items.digits.reverse.each { |lcd| array << matrix_display[lcd] }
    else
      items.chars.each { |lcd| array << matrix_display[lcd] }
    end
    render_num_letters(array)
  end

  def matrix_display
    {
      0 => [space, underscore, space, newline, pipe, space, pipe, newline, pipe, underscore, pipe, newline],
      1 => [space, space, space, newline, space, space, pipe, newline, space, space, pipe, newline],
      2 => [space, underscore,space, newline, space, underscore, pipe, newline, pipe, underscore, space, newline],
      3 => [space, underscore, space, newline, space, underscore, pipe, newline, space, underscore, pipe, newline],
      4 => [space, space, space, newline, pipe, underscore, pipe, newline, space, space, pipe, newline],
      5 => [space, underscore, space, newline, pipe, underscore, space, newline, space, underscore, pipe, newline, newline],
      6 => [space, underscore, space, newline, pipe, underscore, space, newline, pipe, underscore, pipe, newline],
      7 => [space, underscore, space, newline, space, space, pipe, newline, space, space, pipe, newline],
      8 => [space, underscore, space, newline, pipe, underscore, pipe, newline, pipe, underscore, pipe, newline],
      9 => [space, underscore, space, newline, pipe, underscore, pipe, newline, space, underscore, pipe, newline],
      'a' => [space, underscore, space, newline, pipe, underscore, pipe, newline, pipe, space, pipe, newline],
      'b' => [space, space, space, newline, pipe, underscore, space, newline, pipe, underscore, pipe, newline],
      'c' => [space, underscore, space, newline, pipe, space, space, newline, pipe, underscore, space, newline],
      'd' => [space, space, space, newline, space, underscore, pipe, newline, pipe, underscore, pipe, newline],
      'e' => [space, underscore, space, newline, pipe, underscore, space, newline, pipe, underscore, space, newline],
      'f' => [space, underscore, space, newline, pipe, underscore,space, newline, pipe,space, space, newline]
    }
  end

  private

  def render_num_letters(array)
    arr1 = []
    arr2 = []
    arr3 = []
    array.map.each { |item|
      new_data = 0
      item.map.each { |option|
        if option != newline && new_data.zero?
          arr1 << option
        elsif option != newline && new_data == 1
          arr2 << option
        elsif option != newline && new_data == 2
          arr3 << option
        elsif option == newline
          new_data += 1
        end
      }
    }
    (arr1.push(newline) + arr2.push(newline) + arr3.push(newline)).join
  end
end