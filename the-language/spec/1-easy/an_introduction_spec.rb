# frozen_string_literal: true

RSpec.describe 'An introduction to ruby' do
  context 'using RSpec expectations' do
    it 'checks reality' do
      expect(true).to be false # it should be true
    end

    it 'verifies our expectations against reality' do
      expected = __
      actual   = 1 + 1

      expect(actual).to be expected
    end

    it 'has better ways to compare equality' do
      expected = __
      actual   = 1 + 1

      expect(actual).to eq(expected)
    end

    it 'allows you to fill in values' do
      expect(1 + 1).to eq(__)
    end
  end
end
