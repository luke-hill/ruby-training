# frozen_string_literal: true

require 'number_converter'

RSpec.describe NumberConverter do
  it 'can convert 0' do
    question = 0
    expect('zero').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 1' do
    question = 1
    expect('one').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 14' do
    question = 14
    expect('fourteen').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 20' do
    question = 20
    expect('twenty').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 22' do
    question = 22
    expect('twenty-two').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 100' do
    question = 100
    expect('one hundred').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 123' do
    question = 123
    expect('one hundred twenty-three').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 1000' do
    question = 1_000
    expect('one thousand').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 1234' do
    question = 1_234
    expect('one thousand two hundred thirty-four').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 1000000' do
    question = 1_000_000
    expect('one million').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 1002345' do
    question = 1_002_345
    expect('one million two thousand three hundred forty-five').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 1000000000' do
    question = 1_000_000_000
    expect('one billion').to eq(NumberConverter.new(question).in_english)
  end

  it 'can convert 987654321123' do
    question = 987_654_321_123
    expect('nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three').to eq(NumberConverter.new(question).in_english)
  end

  context 'with invalid inputs' do
    it 'does not like inputs that are not numbers' do
      question = 'abc'
      expect { NumberConverter.new(question).in_english }.to raise_error(ArgumentError)
    end

    it 'does not like inputs that are not within the lower range' do
      question = -1
      expect { NumberConverter.new(question).in_english }.to raise_error(ArgumentError)
    end

    it 'does not like inputs that are not within the upper range' do
      question = 1_000_000_000_000
      expect { NumberConverter.new(question).in_english }.to raise_error(ArgumentError)
    end
  end
end
