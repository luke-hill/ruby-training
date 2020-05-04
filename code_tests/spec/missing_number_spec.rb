# frozen_string_literal: true

require 'missing_number'

RSpec.describe MissingNumber do
  let(:missing_number) { subject }

  context 'with an ordered array' do
    it 'detects the first missing number as 1' do
      expect(missing_number.detect([])).to eq(1)
    end

    it 'detects the second missing number as 2' do
      expect(missing_number.detect([1])).to eq(2)
    end

    it 'detects the fifth missing number as 5' do
      expect(missing_number.detect([1, 2, 3, 4])).to eq(5)
    end

    it 'detects a missing number in a small array' do
      expect(missing_number.detect([1, 3, 4, 5])).to eq(2)
    end

    it 'detects a missing number in a large array' do
      expect(missing_number.detect([1, 2, 3, 4, 5, 6, 7, 8, 10, 11])).to eq(9)
    end
  end

  context 'with an unordered array' do
    it 'detects the fifth missing number as 5' do
      expect(missing_number.detect([1, 4, 3, 2])).to eq(5)
    end

    it 'detects a missing number in a small array' do
      expect(missing_number.detect([1, 5, 3, 4])).to eq(2)
    end

    it 'detects a missing number in a large array' do
      expect(missing_number.detect([1, 3, 4, 5, 7, 8, 6, 11, 2, 10])).to eq(9)
    end
  end

  it 'does not like inputs that contain strings in the array' do
    expect { missing_number.detect(['one', 2]) }.to raise_error(ArgumentError)
  end
end
