# frozen_string_literal: true

class Dice

      def roll(n)
        @values = []
          i=0
          while(i<=(n-1))
            @values[i]=rand(1..5)
            i +=1
          end
          @values
          end
      def values
        @values
        end
      end

RSpec.describe Dice do
    let(:dice) { subject }
    dice = Dice.new

    it 'can roll some dice' do
      expect { dice.roll }.not_to raise_error
    end

    it 'returns an array of values when rolled' do
      dice.roll(5)
      expect(dice.values).to be_an(Array)
    end

    it 'returns an array of 1 die by default' do
      dice.roll
      expect(dice.values.size).to eq(1)
    end

    it 'returns an array of values the same size as the requested amount' do
      dice.roll(5)
      expect(dice.values.size).to eq(5)
    end

    it 'returns a set of integers between 1 and 6 when rolled' do
      dice.roll(5)
      dice.values.each do |value|
        expect(value >= 1 && value <= 6).to eq(true)
      end
    end

    it 'maintains the values until rolled again' do
      dice.roll(5)
      first_time = dice.values
      second_time = dice.values
      expect(second_time).to eq(first_time)
    end

    it 'changes the values when rolled again' do
      dice.roll(5)
      first_time = dice.values

      dice.roll(5)
      second_time = dice.values

      expect(second_time).not_to eq(first_time), 'Two rolls should not be equal'

      # THINK ABOUT IT:
      #
      # If the rolls are random, then it is possible (although not
      # likely) that two consecutive rolls are equal.  What would be a
      # better way to test this?
    end
  end

