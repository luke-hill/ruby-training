# frozen_string_literal: true

class LetterValidator
  def validate(letter)
    return [:vowel] if letter.match?(/[aeiou]/)
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError; end
