# frozen_string_literal: true

require 'number_converter'

RSpec.describe NumberConverter do
  it 'can convert 0' do
    question = 0
    expect(described_class.new(question).in_english).to eq('zero')
  end

  it 'can convert 1' do
    question = 1
    expect(described_class.new(question).in_english).to eq('one')
  end

  it 'can convert 14' do
    question = 14
    expect(described_class.new(question).in_english).to eq('fourteen')
  end

  it 'can convert 20' do
    question = 20
    expect(described_class.new(question).in_english).to eq('twenty')
  end

  it 'can convert 22' do
    question = 22
    expect(described_class.new(question).in_english).to eq('twenty-two')
  end

  it 'can convert 100' do
    question = 100
    expect(described_class.new(question).in_english).to eq('one hundred')
  end

  it 'can convert 123' do
    question = 123
    expect(described_class.new(question).in_english)
      .to eq('one hundred twenty-three')
  end

  it 'can convert 1000' do
    question = 1_000
    expect(described_class.new(question).in_english).to eq('one thousand')
  end

  it 'can convert 1234' do
    question = 1_234
    expect(described_class.new(question).in_english)
      .to eq('one thousand two hundred thirty-four')
  end

  it 'can convert 1000000' do
    question = 1_000_000
    expect(described_class.new(question).in_english).to eq('one million')
  end

  it 'can convert 1002345' do
    question = 1_002_345
    expect(described_class.new(question).in_english)
      .to eq('one million two thousand three hundred forty-five')
  end

  it 'can convert 1000000000' do
    question = 1_000_000_000
    expect(described_class.new(question).in_english).to eq('one billion')
  end

  it 'can convert 987654321123' do
    question = 987_654_321_123
    expect(described_class.new(question).in_english)
      .to eq('nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three')
  end

  context 'with invalid inputs' do
    it 'does not like inputs that are not numbers' do
      question = 'abc'
      expect { described_class.new(question).in_english }
        .to raise_error(ArgumentError)
    end

    it 'does not like inputs that are not within the lower range' do
      question = -1
      expect { described_class.new(question).in_english }
        .to raise_error(ArgumentError)
    end

    it 'does not like inputs that are not within the upper range' do
      question = 1_000_000_000_000
      expect { described_class.new(question).in_english }
        .to raise_error(ArgumentError)
    end
  end
end
