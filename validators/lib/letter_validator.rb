# frozen_string_literal: true

class LetterValidator
  attr_reader :alphabet

  def initialize
    @alphabet = []
  end

  def validate(letter)
    raise InvalidLetterError if letter.length> 1
    alphabet<<vowels_check(letter)
    alphabet<<check_first_half(letter)
    alphabet<<check_common_letter(letter)
  end

  def vowels_check(letter)
    vowels = %w[a e i o u]
    case letter
    when *vowels
      :vowel
    else
      :consonant
    end
  end

  def check_first_half(letter)
    case letter
    when 'a'..'m'
      :first_half
    else
      :second_half
    end
  end

  def check_common_letter(letter)
    :common_letter
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError;
end


