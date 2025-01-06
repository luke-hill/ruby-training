# frozen_string_literal: true

RSpec.describe GameOfLife::Game do
  subject(:game) { described_class.new }

  it 'has an initial state containing cells' do
    expect(game.cells).to be_an Array
  end

  it 'contains a series of GameOfLife::Cells' do
    expect(game.cells.first).to all be_a GameOfLife::Cell
  end

  describe '#cell_at' do
    it 'returns the individual cell using its specific co-ordinates' do
      expect(game.cell_at(0, 0)).to be_a GameOfLife::Cell
    end
  end

  describe '#left_neighbour' do
    context 'when not on the left side of the grid' do
      it 'returns the individual cell that is one square left of the supplied co-ordinates' do
        expect(game.left_neighbour(3, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(game.left_neighbour(0, 0)).to be_nil
      end
    end
  end
end
