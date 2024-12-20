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

  describe '#grid_size' do
    it 'generates the width of the game board' do
      expect(game.cells.map(&:length)).to all eq(game.grid_size)
    end

    it 'generates the height of the game board' do
      expect(game.cells.length).to eq(game.grid_size)
    end
  end

  describe '#left_neighbour' do
    context 'when not on the left side of the grid' do
      it 'returns the individual cell that is one square to the left of the supplied co-ordinates' do
        expect(game.left_neighbour(3, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(game.left_neighbour(0, 0)).to be_nil
      end
    end
  end

  describe '#right_neighbour' do
    context 'when not on the right side of the grid' do
      it 'returns the individual cell that is one square to the right of the supplied co-ordinates' do
        expect(game.right_neighbour(3, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(game.right_neighbour(game.grid_size, 0)).to be_nil
      end
    end
  end

  describe '#top_neighbour' do
    context 'when not on the top row of the grid' do
      it 'returns the individual cell that is one square above the supplied co-ordinates' do
        expect(game.top_neighbour(0, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the top row of the grid' do
      it 'returns no cell' do
        expect(game.top_neighbour(0, 0)).to be_nil
      end
    end
  end


  describe '#bottom_neighbour' do
    context 'when not on the bottom row of the grid' do
      it 'returns the individual cell that is one square below the supplied co-ordinates' do
        expect(game.bottom_neighbour(0, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the bottom row of the grid' do
      it 'returns no cell' do
        expect(game.bottom_neighbour(0, game.grid_size)).to be_nil
      end
    end
  end
end
