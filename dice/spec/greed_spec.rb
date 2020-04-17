# frozen_string_literal: true

require 'greed'

RSpec.describe 'scoring a game of greed' do
  it 'scores an empty list as 0' do
    expect(score([])).to eq(0)
  end

  it 'scores a single 5 as 50' do
    expect(score([5])).to eq(50)
  end

  it 'scores a single 1 as 100' do
    expect(score([1])).to eq(100)
  end

  it 'scores a single 2,3,4 or 6 as 0' do
    expect(score([2])).to eq(0)
    expect(score([3])).to eq(0)
    expect(score([4])).to eq(0)
    expect(score([6])).to eq(0)
  end

  it 'scores multiple 1s and 5s as a sum of the individual scores' do
    expect(score([1, 5, 5, 1])).to eq(300)
  end

  it 'scores a combination of 2s, 3s, 4s and 6s as 0' do
    expect(score([2, 3, 4, 6])).to eq(0)
  end

  it 'scores triple 1 as 1000' do
    expect(score([1, 1, 1])).to eq(1000)
  end

  it 'scores other triples as face value * 100' do
    expect(score([2, 2, 2])).to eq(200)
    expect(score([3, 3, 3])).to eq(300)
    expect(score([4, 4, 4])).to eq(400)
    expect(score([5, 5, 5])).to eq(500)
    expect(score([6, 6, 6])).to eq(600)
  end

  it 'can score mixed throws' do
    expect(score([2, 5, 2, 2, 3])).to eq(250)
    expect(score([5, 5, 5, 5])).to eq(550)
    expect(score([1, 1, 1, 1])).to eq(1100)
    expect(score([1, 1, 1, 1, 1])).to eq(1200)
    expect(score([1, 1, 1, 5, 1])).to eq(1150)
  end
end
