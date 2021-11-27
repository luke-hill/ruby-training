# frozen_string_literal: true

require 'greed'

RSpec.describe Greed do
  let(:greed) { subject }

  context 'with simple scoring hands' do
    it 'requires an array input' do
      expect { greed.score }.to raise_error(GreedError)
    end

    it 'scores a blank array as 0' do
      expect(greed.score([])).to eq(0)
    end

    it 'scores a single 5 as 50' do
      expect(greed.score([5])).to eq(50)
    end

    it 'scores a single 1 as 100' do
      expect(greed.score([1])).to eq(100)
    end

    it 'scores a single 2 as 0' do
      expect(greed.score([2])).to eq(0)
    end

    it 'scores a single 3 as 0' do
      expect(greed.score([3])).to eq(0)
    end

    it 'scores a single 4 as 0' do
      expect(greed.score([4])).to eq(0)
    end

    it 'scores a single 6 as 0' do
      expect(greed.score([6])).to eq(0)
    end

    it 'scores multiple 1s and 5s as a sum of the individual scores' do
      expect(greed.score([1, 5, 5, 1])).to eq(300)
    end

    it 'scores a combination of 2s, 3s, 4s and 6s as 0' do
      expect(greed.score([2, 3, 4, 6])).to eq(0)
    end

    it 'scores triple 1 as 1000' do
      expect(greed.score([1, 1, 1])).to eq(1000)
    end

    it 'scores triple 2 as 200' do
      expect(greed.score([2, 2, 2])).to eq(200)
    end

    it 'scores triple 3 as 300' do
      expect(greed.score([3, 3, 3])).to eq(300)
    end

    it 'scores triple 4 as 400' do
      expect(greed.score([4, 4, 4])).to eq(400)
    end

    it 'scores triple 5 as 500' do
      expect(greed.score([5, 5, 5])).to eq(500)
    end

    it 'scores triple 6 as 600' do
      expect(greed.score([6, 6, 6])).to eq(600)
    end
  end

  context 'with a low scoring hand' do
    it 'scores 50 for a 2, 3, 4, 5 and 6' do
      expect(greed.score([2, 3, 4, 5, 6])).to eq(50)
    end

    it 'scores 150 for a 1, 2, 3, 4 and 5' do
      expect(greed.score([1, 2, 3, 4, 5])).to eq(150)
    end
  end

  context 'with a medium scoring hand' do
    it 'scores 450 for 4 4s and a 5' do
      expect(greed.score([4, 4, 4, 4, 5])).to eq(450)
    end

    it 'scores 550 for 4 5s and a 4' do
      expect(greed.score([4, 5, 5, 5, 5])).to eq(550)
    end

    it 'scores 600 for 2 1s and 3 4s' do
      expect(greed.score([1, 4, 4, 4, 1])).to eq(600)
    end
  end

  context 'with a high scoring hand' do
    it 'scores 800 for 2 1s and 3 6s' do
      expect(greed.score([1, 6, 1, 6, 6])).to eq(800)
    end

    it 'scores 1050 for 3 1s a 5 and a 6' do
      expect(greed.score([1, 1, 1, 5, 6])).to eq(1050)
    end

    it 'scores 1200 (a perfect game), for 5 1s' do
      expect(greed.score([1, 1, 1, 1, 1])).to eq(1200)
    end
  end
end
