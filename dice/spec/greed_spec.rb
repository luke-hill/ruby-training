# frozen_string_literal: true

require 'greed'

RSpec.describe Dice::Greed do
  it 'scores an empty list as 0' do
    expect(subject.score([])).to eq(0)
  end

  it 'scores a single 5 as 50' do
    expect(subject.score([5])).to eq(50)
  end

  it 'scores a single 1 as 100' do
    expect(subject.score([1])).to eq(100)
  end

  it 'scores a single 2, 3, 4 or 6 as 0' do
    expect(subject.score([2])).to eq(0)
    expect(subject.score([3])).to eq(0)
    expect(subject.score([4])).to eq(0)
    expect(subject.score([6])).to eq(0)
  end

  it 'scores multiple 1s and 5s as a sum of the individual subject.scores' do
    expect(subject.score([1, 5, 5, 1])).to eq(300)
  end

  it 'scores a combination of 2s, 3s, 4s and 6s as 0' do
    expect(subject.score([2, 3, 4, 6])).to eq(0)
  end

  it 'scores triple 1 as 1000' do
    expect(subject.score([1, 1, 1])).to eq(1000)
  end

  it 'scores other triples as face value * 100' do
    expect(subject.score([2, 2, 2])).to eq(200)
    expect(subject.score([3, 3, 3])).to eq(300)
    expect(subject.score([4, 4, 4])).to eq(400)
    expect(subject.score([5, 5, 5])).to eq(500)
    expect(subject.score([6, 6, 6])).to eq(600)
  end

  it 'can score complete throws' do
    expect(subject.score([1, 2, 3, 4, 5])).to eq(150)
    expect(subject.score([2, 5, 2, 2, 3])).to eq(250)
    expect(subject.score([4, 4, 4, 4, 5])).to eq(450)
    expect(subject.score([4, 5, 5, 5, 5])).to eq(550)
    expect(subject.score([1, 6, 6, 6, 6])).to eq(700)
    expect(subject.score([1, 1, 1, 1, 6])).to eq(1100)
    expect(subject.score([1, 1, 1, 5, 1])).to eq(1150)
    expect(subject.score([1, 1, 1, 1, 1])).to eq(1200)
  end
end
