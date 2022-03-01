# frozen_string_literal: true

class LetterValidator
  def validate(letter)
    raise InvalidLetterError if letter.length>1
    vowels = %w[a e i o u]
    case letter
    when *vowels
      [:vowel]
    else
      [:consonant]
    end
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError;
end


