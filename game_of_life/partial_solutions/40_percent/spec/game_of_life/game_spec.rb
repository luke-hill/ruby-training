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

  describe '#neighbours' do
    context 'when at the top left of the grid' do
      it 'returns only 3 neighbours' do
        expect(game.neighbours(0, 0).length).to eq(3)
      end
    end

    context 'when at the top of the grid' do
      it 'returns 5 neighbours' do
        expect(game.neighbours(3, 0).length).to eq(5)
      end
    end

    context 'when at the top right of the grid' do
      it 'returns only 3 neighbours' do
        expect(game.neighbours(game.grid_size, 0).length).to eq(3)
      end
    end

    context 'when in the centre of the grid' do
      it 'returns a full 8 neighbours' do
        expect(game.neighbours(3, 3).length).to eq(8)
      end
    end

    context 'when at the bottom left of the grid' do
      it 'returns only 3 neighbours' do
        expect(game.neighbours(0, game.grid_size).length).to eq(3)
      end
    end

    context 'when at the bottom of the grid' do
      it 'returns 5 neighbours' do
        expect(game.neighbours(3, game.grid_size).length).to eq(5)
      end
    end

    context 'when at the bottom right of the grid' do
      it 'returns only 3 neighbours' do
        expect(game.neighbours(game.grid_size, game.grid_size).length).to eq(3)
      end
    end
  end

  describe '#top_left_neighbour' do
    context 'when not on the left side or the top of the grid' do
      it 'returns the individual cell that is one square to the left and one square above the supplied co-ordinates' do
        expect(game.top_left_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(game.top_left_neighbour(0, 3)).to be_nil
      end
    end

    context 'when on the top of the grid' do
      it 'returns no cell' do
        expect(game.top_left_neighbour(3, 0)).to be_nil
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

  describe '#top_right_neighbour' do
    context 'when not on the right side or the top of the grid' do
      it 'returns the individual cell that is one square to the right and one square above the supplied co-ordinates' do
        expect(game.top_right_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the right side of the grid' do
      it 'returns no cell' do
        expect(game.top_right_neighbour(game.grid_size, 3)).to be_nil
      end
    end

    context 'when on the top row of the grid' do
      it 'returns no cell' do
        expect(game.top_right_neighbour(3, 0)).to be_nil
      end
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

    context 'when on the right side of the grid' do
      it 'returns no cell' do
        expect(game.right_neighbour(game.grid_size, 0)).to be_nil
      end
    end
  end

  describe '#bottom_left_neighbour' do
    context 'when not on the left side or the bottom of the grid' do
      it 'returns the individual cell that is one square to the left and one square below the supplied co-ordinates' do
        expect(game.bottom_left_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(game.bottom_left_neighbour(0, 3)).to be_nil
      end
    end

    context 'when on the bottom row of the grid' do
      it 'returns no cell' do
        expect(game.bottom_left_neighbour(3, game.grid_size)).to be_nil
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

  describe '#bottom_right_neighbour' do
    context 'when not on the right side or the bottom of the grid' do
      it 'returns the individual cell that is one square to the right and one square below the supplied co-ordinates' do
        expect(game.bottom_right_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the right side of the grid' do
      it 'returns no cell' do
        expect(game.bottom_right_neighbour(game.grid_size, 3)).to be_nil
      end
    end

    context 'when on the bottom row of the grid' do
      it 'returns no cell' do
        expect(game.bottom_right_neighbour(3, game.grid_size)).to be_nil
      end
    end
  end
end
