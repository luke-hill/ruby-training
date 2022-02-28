# frozen_string_literal: true

class LetterValidator
  def validate(letter)
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




