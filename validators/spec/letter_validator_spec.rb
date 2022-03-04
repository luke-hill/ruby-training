# frozen_string_literal: true

require 'letter_validator' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/letter_validator.rb to fix these tests

RSpec.describe LetterValidator do
  subject(:validation) { described_class.new }

  context 'with a single letter' do
    it 'validates all vowels' do
      %w[a e i o u].each do |letter|
        expect(validation.validate(letter)).to include(:vowel)
      end
    end

    it 'validates all consonants' do
      consonants = ('a'..'z').to_a - %w[a e i o u]
      consonants.each do |letter|
        expect(validation.validate(letter)).to include(:consonant)
      end
    end

    it 'validates letters in the first half of the alphabet' do
      ('a'..'m').each do |letter|
        expect(validation.validate(letter)).to include(:first_half)
      end
    end

    it 'validates letters in the second half of the alphabet' do
      ('n'..'z').each do |letter|
        expect(validation.validate(letter)).to include(:second_half)
      end
    end

    it 'validates the most common letters' do
      %w[e t a i o].each do |letter|
        expect(validation.validate(letter)).to include(:common_letter)
      end
    end

    it 'does not validate letters that are not common' do
      uncommon_letters = ('a'..'z').to_a - %w[e t a i o]
      uncommon_letters.each do |letter|
        expect(validation.validate(letter)).not_to include(:common_letter)
      end
    end
  end

  context 'with multiple letters' do
    it { expect { validation.validate('ab') }.to raise_error(InvalidLetterError) }
  end
end
