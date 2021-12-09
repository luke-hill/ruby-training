# frozen_string_literal: true

class LetterValidator
  attr_reader :group
  def initialize
    @group = []
  end

  def validate(letter)
    group << validate_type(letter)
    group << validate_position(letter)
  end
  
  private

  def validate_type(letter)
    return :vowel if letter.match?(/[aeiou]/)

    :consonant
  end

  def validate_position(letter)
    return :first_half if letter.match?(/[a-m]/)

    :second_half
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError; end
