class NumberConverter
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def in_english
    case number
    when 0 then zero
    when 1..9 then digit
    when 10..19 then ten_to_nineteen
    when 20..99 then twenty_to_ninety_nine
    when 100..999 then hundred_to_nine_hundred_ninety_nine
    else 'who knows'
    end
  end

  private

  def zero
    "zero"
  end

  def digit
    units[number]
  end

  def ten_to_nineteen
    teens[number]
  end

  def twenty_to_ninety_nine
    [
      tens[ten_amount],
      units[unit_amount]
    ].compact.join("-")
  end

  def unit_amount
    number % 10
  end

  def ten_amount
    number / 10
  end

  def hundred_amount
    number / 100
  end

  def hundred_to_nine_hundred_ninety_nine
    [
      "#{units[hundred_amount]} hundred",
      twenty_to_ninety_nine
    ].reject(&:empty?).join(" ")
  end

  def big_numbers
    {
      100 => "hundred",
      1_000 => "thousand",
      1_000_000 => "million",
      1_000_000_000 => "billion",
    }
  end

  def units
    {
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
    }
  end

  def teens
    {
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
    }
  end

  def tens
    {
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety",
    }
  end
end
