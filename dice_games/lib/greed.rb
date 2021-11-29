# frozen_string_literal: true

class Greed
    # def score(dice)
    #     if dice == []
    #         return 0
    #     else dice == nil
    #         raise GreedError
    #     end
    # end
    # def values
    #     @values
    # end
    # def score(dice=[])
    #     ## score is set to 0 to start off so if no dice, no score
    #     score = 0
    #     ## setting the 1000 1,1,1 rule
    #     score += 1000 if (dice.count(1) / 3) == 1
    #     ## taking care of the single 5s and 1s here
    #     score += (dice.count(5) % 3) * 50
    #     score += (dice.count(1) % 3) * 100
    #     ## set the other triples here
    #     [2, 3, 4, 5, 6].each do |num|
    #       score += num * 100 if (dice.count(num) / 3 ) == 1
    #     end
    #     score
    #   end
    def score(dice=[])
      raise GreedError if dice == []
      total = 0

      dice.uniq.each do |num|

      if num == 1

        if dice.count(1) >= 3

          total += 1000

          total += 100 * (dice.count(1) - 3)

        else

          total += 100 * dice.count(1)

        end

      elsif num == 5

        if dice.count(5) >= 3

          total += 5  * 100

          total += 50 * (dice.count(5) - 3)

        else

          total += 50 * dice.count(5)

        end

      else

        total += num * 100 if dice.count(num) >= 3

      end
      end

      total

      end
end

class GreedError < StandardError
end

RSpec.describe Greed do
    let(:greed) { subject }
    greed = Greed.new

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

