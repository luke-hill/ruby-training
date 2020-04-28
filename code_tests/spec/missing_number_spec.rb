# frozen_string_literal: true

require 'missing_number'

RSpec.describe MissingNumber do
  let(:missing_number) { subject }

  it 'detects the first missing number as 1' do
    expect(missing_number.detect([])).to eq(1)
  end

  it 'detects the second missing number as 2' do
    expect(missing_number.detect([1])).to eq(2)
  end

  it 'detects a missing number in a small ordered array' do
    expect(missing_number.detect([1, 3, 4, 5])).to eq(2)
  end

  it 'detects a missing number in a large ordered array' do
    expect(missing_number.detect([1, 2, 3, 4, 5, 7, 8])).to eq(6)
  end

  it 'detects a missing number in a large un-ordered array' do
    expect(missing_number.detect([1, 3, 4, 5, 7, 8, 6, 11, 2, 10])).to eq(9)
  end

  it 'does not like inputs that contain strings in the array' do
    expect { missing_number.detect(['one', 2]) }.to raise_error(ArgumentError)
  end
end
