class LCD
  attr_reader :input, :width, :height

  def initialize(input, width: 1, height: 1)
    @input = input
    @width = width
    @height = height
  end

  def render
    "#{render_line_one}\n"\
    "#{render_height_between_lines_one_and_two}"\
    "#{render_line_two}\n"\
    "#{render_height_between_lines_two_and_three}"\
    "#{render_line_three}\n"
  end

  private

  def render_height_between_lines_one_and_two
    spaces = ' ' * width
    one_line = number_as_digits.map { |digit| first_height_extender(digit, spaces) }.join

    "#{one_line}\n" * (height - 1)
  end

  def render_height_between_lines_two_and_three
    spaces = ' ' * width
    one_line = number_as_digits.map { |digit| second_height_extender(digit, spaces) }.join

    "#{one_line}\n" * (height - 1)
  end

  def render_line_one
    number_as_digits.map { |digit| line_one(digit) }.join
  end

  def render_line_two
    number_as_digits.map { |digit| line_two(digit) }.join
  end

  def render_line_three
    number_as_digits.map { |digit| line_three(digit) }.join
  end

  def number_as_digits
    if input.is_a?(Integer)
      input.digits.reverse
    else
      input.each_char
    end
  end

  def line_one(digit)
    " #{underscore(digit, 0)} "
  end

  def first_height_extender(digit, spaces)
    "#{pipe(digit, 1)}#{spaces}#{pipe(digit, 3)}"
  end

  def line_two(digit)
    "#{pipe(digit, 1)}#{underscore(digit, 2)}#{pipe(digit, 3)}"
  end

  def second_height_extender(digit, spaces)
    "#{pipe(digit, 4)}#{spaces}#{pipe(digit, 6)}"
  end

  def line_three(digit)
    "#{pipe(digit, 4)}#{underscore(digit, 5)}#{pipe(digit, 6)}"
  end

  def underscore(digit, position)
    if write_character?(digit, position)
      '_' * width
    else
      ' ' * width
    end
  end

  def pipe(digit, position)
    if write_character?(digit, position)
      '|'
    else
      ' '
    end
  end

  def write_character?(digit, position)
    lcd_table[digit].include?(position)
  end

  def lcd_table #Top,Mid-Left,Mid,Mid-Right,Bot-Left,Bot,Bot-Right
    {
      1 => [3, 6],
      2 => [0, 2, 3, 4, 5],
      3 => [0, 2, 3, 5, 6],
      4 => [1, 2, 3, 6],
      5 => [0, 1, 2, 5, 6],
      6 => [0, 1, 2, 4, 5, 6],
      7 => [0, 3, 6],
      8 => [0, 1, 2, 3, 4, 5, 6],
      9 => [0, 1, 2, 3, 5, 6],
      'a' => [0, 2, 3, 4, 5, 6],
      'b' => [1, 2, 4, 5, 6],
      'c' => [2, 4, 5],
      'd' => [2, 3, 4, 5, 6],
      'e' => [0, 1, 2, 4, 5],
      'f' => [0, 1, 2, 4],
    }
  end
end
