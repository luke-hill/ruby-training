# frozen_string_literal: true

RSpec.describe GameOfLife::Game do
  subject(:game) { described_class.new }

  describe '#grid' do
    it 'represents the current Game of Life grid of cells' do
      expect(game.grid).to be_a(GameOfLife::Grid)
    end
  end

  describe '#grid_size' do
    it 'sets the size of the game' do
      expect(game.grid_size).to eq(10)
    end
  end

  describe '#tick' do
    it 'is TBD' do
      expect(game.tick).to eq(:TICK)
    end
  end
end
