# frozen_string_literal: true

class LetterValidator
  attr_reader :group
  def initialize
    @group = []
  end

  def validate(letter)
    if letter.match?(/[aeiou]/)
      group << :vowel
    else
      group << :consonant
    end

    if letter.match?(/[a-m]/)
      group << :first_half
    else
      group << :second_half
    end
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError; end
