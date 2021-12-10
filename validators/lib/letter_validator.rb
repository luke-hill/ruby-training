# frozen_string_literal: true

class LetterValidator
  attr_reader :group

  def initialize
    @group = []
  end

  def validate(letter)
    raise InvalidLetterError if letter.length > 1

    group << validate_type(letter)
    group << validate_position(letter)
    group << validate_frequency(letter)
    # This does return an extra nil inside our responses, but the spec doesn't forbid this!
    # We can just `#compact` things if this is the case
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

  def validate_frequency(letter)
    return :common_letter if letter.match?(/[etaio]/)
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError; end
