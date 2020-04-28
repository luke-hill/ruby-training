class NumberConverter
  attr_reader :number
  attr_accessor :number_chunk

  def initialize(number)
    @number = number
  end

  def in_english
    return "zero" if number.zero?
    raise ArgumentError unless number.between?(0, 999_999_999_999)

    # Remove any items beforehand which are blank (2 * Slower than line 24-25)
    # reverse_chunked_number.reject! { |chunk| chunk == [0, 0, 0] }

    # Create a newly zipped array with the number chunks in reverse with their corresponding word-prefixes
    output_array = reverse_chunked_number.map do |chunk|
      partial_word(chunk)
    end.zip(ascending_word_chunks)

    # Remove any items which are completely nil, i.e. nil million shouldn't be included (2 * Faster than line 16-17)
    output_array.reject! { |quantity, _word| quantity.nil? }

    # Now re-salt the array, and remove any trailing spaces
    output_array.reverse.join(" ").strip
  end

  private

  def partial_word(chunk)
    self.number_chunk = chunk.join.to_i

    case number_chunk
    when 0 then nil
    when 1..9 then units[number_chunk]
    when 10..19 then teens[number_chunk]
    when 20..99 then _20_to_99
    else _100_to_999
    end
  end

  def _20_to_99
    [t, u].compact.join("-")
  end

  def _100_to_999
    [h, _20_to_99].compact.reject(&:empty?).join(" ")
  end

  def h
    "#{units[hundred_amount]} hundred"
  end

  def t
    tens[ten_amount]
  end

  def u
    units[unit_amount]
  end

  def hundred_amount
    number_chunk / 100
  end

  # The dual action here is needed to prevent amounts >= 10 (i.e. 12 tens)
  def ten_amount
    (number_chunk % 100) / 10
  end

  def unit_amount
    number_chunk % 10
  end

  def ascending_word_chunks
    [nil, "thousand", "million", "billion"]
  end

  def reverse_chunked_number
    digits(number).each_slice(3).map(&:reverse)
  end

  # Stolen from Ruby 2.4
  def digits(number)
    number.to_s.chars.map(&:to_i).reverse
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
