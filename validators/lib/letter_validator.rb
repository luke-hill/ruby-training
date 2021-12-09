# frozen_string_literal: true

class LetterValidator
  attr_reader :group
  def initialize
    @group = []
  end
  
  def validate(letter)
    if letter.match?(/[aeiou]/)
      [:vowel]
    else
      [:consonant]
    end
  end
end

# Do not edit this code!
class InvalidLetterError < ArgumentError; end
