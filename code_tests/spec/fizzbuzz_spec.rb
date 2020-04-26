# frozen_string_literal: true

require 'fizzbuzz'

RSpec.describe Fizzbuzz do
  let(:fizzbuzz) { subject }

  it 'plays fizzbuzz to 5 with fizz rules' do
    expect(fizzbuzz.play(3)).to eq([1, 2, 'fizz'])
  end

  it 'plays fizzbuzz to 5 with fizz and buzz rules' do
    expect(fizzbuzz.play(5)).to eq([1, 2, 'fizz', 4, 'buzz'])
  end

  it 'plays fizzbuzz to 15 with fizz, buzz rules and fizzbuzz rules' do
    expect(fizzbuzz.play(15)).to eq([1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz'])
  end

  it 'plays fizzbuzz to 30 with fizz, buzz rules and fizzbuzz rules' do
    expect(fizzbuzz.play(30))
      .to eq([1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz',
              11, 'fizz', 13, 14, 'fizzbuzz', 16, 17, 'fizz', 19, 'buzz',
              'fizz', 22, 23, 'fizz', 'buzz', 26, 'fizz', 28, 29, 'fizzbuzz'])
  end
end
