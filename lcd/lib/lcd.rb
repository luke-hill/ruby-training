# frozen_string_literal: true

class LCD
  attr_reader :number_or_string

  def initialize(number_or_string)
    @number_or_string = number_or_string
  end

  def render
    display = single_number_or_letter.map { |number_or_letter| display_character(number_or_letter) }
    display.transpose.map { |grouped_segments| grouped_segments.push("\n")}.join
  end

  def single_number_or_letter
    if number_or_string.is_a?(Numeric)
      number_or_string.digits.reverse
    else
      number_or_string.chars
    end
  end

  def display_character(individual_digit_or_char)
    lcd_states = %w[line_one line_two line_three]
    lcd_states.map.with_index do |line_number, index|
      if line_number == "line_one"
        " " + horizontal_segment(lcd_display[individual_digit_or_char][index]) + " "
      else
        other_segments(line_number, individual_digit_or_char, index)
      end
    end
  end

  def other_segments(line_number, digit, segment)
    if line_number == "line_two"
      vertical_segment(lcd_display[digit][segment]) + horizontal_segment(lcd_display[digit][segment + 1]) + vertical_segment(lcd_display[digit][segment + 2])
    else
      vertical_segment(lcd_display[digit][segment + 2]) + horizontal_segment(lcd_display[digit][segment + 3]) + vertical_segment(lcd_display[digit][segment + 4])
    end
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

