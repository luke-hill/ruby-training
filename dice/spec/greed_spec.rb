# frozen_string_literal: true

require 'greed'

RSpec.describe Greed do
  let(:greed) { subject }

  it 'scores an empty list as 0' do
    expect(greed([])).to eq(0)
  end

  it 'scores a single 5 as 50' do
    expect(greed([5])).to eq(50)
  end

  it 'scores a single 1 as 100' do
    expect(greed([1])).to eq(100)
  end

  it 'scores a single 2 as 0' do
    expect(greed([2])).to eq(0)
  end

  it 'scores a single 3 as 0' do
    expect(greed([3])).to eq(0)
  end

  it 'scores a single 4 as 0' do
    expect(greed([4])).to eq(0)
  end

  it 'scores a single 6 as 0' do
    expect(greed([6])).to eq(0)
  end

  it 'scores multiple 1s and 5s as a sum of the individual scores' do
    expect(greed([1, 5, 5, 1])).to eq(300)
  end

  it 'scores a combination of 2s, 3s, 4s and 6s as 0' do
    expect(greed([2, 3, 4, 6])).to eq(0)
  end

  it 'scores triple 1 as 1000' do
    expect(greed([1, 1, 1])).to eq(1000)
  end

  it 'scores triple 2 as 200' do
    expect(greed([2, 2, 2])).to eq(200)
  end

  it 'scores triple 3 as 300' do
    expect(greed([3, 3, 3])).to eq(300)
  end

  it 'scores triple 4 as 200' do
    expect(greed([4, 4, 4])).to eq(400)
  end

  it 'scores triple 5 as 500' do
    expect(greed([5, 5, 5])).to eq(500)
  end

  it 'scores triple 6 as 600' do
    expect(greed([6, 6, 6])).to eq(600)
  end

  context 'with a low scoring hand' do
    it 'scores 50 for a 2, 3, 4, 5 and 6' do
      expect(greed([2, 3, 4, 5, 6])).to eq(50)
    end

    it 'scores 150 for a 1, 2, 3, 4 and 5' do
      expect(greed([1, 2, 3, 4, 5])).to eq(150)
    end
  end

  context 'with a medium scoring hand' do
    it 'scores 450 for 4 4s and a 5' do
      expect(greed([4, 4, 4, 4, 5])).to eq(450)
    end

    it 'scores 550 for 4 5s and a 4' do
      expect(greed([4, 5, 5, 5, 5])).to eq(550)
    end

    it 'scores 700 for 4 6s and a 1' do
      expect(greed([1, 6, 6, 6, 6])).to eq(700)
    end
  end

  context 'with a high scoring hand' do
    it 'scores 1100 for 4 1s and a 6' do
      expect(greed([1, 1, 1, 1, 6])).to eq(1100)
    end

    it 'scores 1150 for 4 1s and a 5' do
      expect(greed([1, 1, 1, 5, 1])).to eq(1150)
    end

    it 'scores 1200 (Perfect Game) for 5 1s' do
      expect(greed([1, 1, 1, 1, 1])).to eq(1200)
    end
  end
end
