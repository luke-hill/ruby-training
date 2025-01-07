# frozen_string_literal: true

RSpec.describe GameOfLife::Grid do
  subject(:grid) { described_class.new(grid_size) }

  let(:grid_size) { 10 }
  let(:max_index) { grid_size - 1 }
  let(:alive_cell) { instance_double(GameOfLife::Cell, alive?: true, dead?: false) }
  let(:dead_cell) { instance_double(GameOfLife::Cell, alive?: false, dead?: true) }

  it 'has an initial state containing cells' do
    expect(grid.cells).to be_an Array
  end

  it 'contains a series of GameOfLife::Cells' do
    expect(grid.cells.first).to all be_a GameOfLife::Cell
  end

  describe '#cell_at' do
    it 'returns the individual cell using its specific co-ordinates' do
      expect(grid.cell_at(0, 0)).to be_a GameOfLife::Cell
    end
  end

  describe '#grid_size' do
    it 'generates the width of the grid board' do
      expect(grid.cells.map(&:length)).to all eq(grid.grid_size)
    end

    it 'generates the height of the grid board' do
      expect(grid.cells.length).to eq(grid.grid_size)
    end
  end

  describe '#alive_neighbours' do
    context 'when there are no alive neighbours' do
      before do
        allow(grid).to receive(:neighbours).and_return([dead_cell, dead_cell, dead_cell])
      end

      it 'returns 0 alive neighbours' do
        expect(grid.alive_neighbours(0, 0)).to eq(0)
      end
    end

    context 'when there are some alive neighbours' do
      before do
        allow(grid).to receive(:neighbours).and_return([dead_cell, alive_cell, dead_cell])
      end

      it 'returns 1 alive neighbours' do
        expect(grid.alive_neighbours(0, 0)).to eq(1)
      end
    end
  end

  describe '#dead_neighbours' do
    context 'when there are no dead neighbours' do
      before do
        allow(grid).to receive(:neighbours).and_return([alive_cell, alive_cell, alive_cell])
      end

      it 'returns 0 dead neighbours' do
        expect(grid.dead_neighbours(0, 0)).to eq(0)
      end
    end

    context 'when there are some dead neighbours' do
      before do
        allow(grid).to receive(:neighbours).and_return([dead_cell, alive_cell, dead_cell])
      end

      it 'returns 2 dead neighbours' do
        expect(grid.dead_neighbours(0, 0)).to eq(2)
      end
    end
  end

  describe '#neighbours' do
    context 'when at the top left of the grid' do
      it 'returns only 3 neighbours' do
        expect(grid.neighbours(0, 0).length).to eq(3)
      end
    end

    context 'when at the top of the grid' do
      it 'returns 5 neighbours' do
        expect(grid.neighbours(3, 0).length).to eq(5)
      end
    end

    context 'when at the top right of the grid' do
      it 'returns only 3 neighbours' do
        expect(grid.neighbours(max_index, 0).length).to eq(3)
      end
    end

    context 'when in the centre of the grid' do
      it 'returns a full 8 neighbours' do
        expect(grid.neighbours(3, 3).length).to eq(8)
      end
    end

    context 'when at the bottom left of the grid' do
      it 'returns only 3 neighbours' do
        expect(grid.neighbours(0, max_index).length).to eq(3)
      end
    end

    context 'when at the bottom of the grid' do
      it 'returns 5 neighbours' do
        expect(grid.neighbours(3, max_index).length).to eq(5)
      end
    end

    context 'when at the bottom right of the grid' do
      it 'returns only 3 neighbours' do
        expect(grid.neighbours(max_index, max_index).length).to eq(3)
      end
    end
  end

  describe '#top_left_neighbour' do
    context 'when not on the left side or the top of the grid' do
      it 'returns the individual cell that is one square to the left and one square above the supplied co-ordinates' do
        expect(grid.top_left_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(grid.top_left_neighbour(0, 3)).to be_nil
      end
    end

    context 'when on the top of the grid' do
      it 'returns no cell' do
        expect(grid.top_left_neighbour(3, 0)).to be_nil
      end
    end
  end

  describe '#top_neighbour' do
    context 'when not on the top row of the grid' do
      it 'returns the individual cell that is one square above the supplied co-ordinates' do
        expect(grid.top_neighbour(0, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the top row of the grid' do
      it 'returns no cell' do
        expect(grid.top_neighbour(0, 0)).to be_nil
      end
    end
  end

  describe '#top_right_neighbour' do
    context 'when not on the right side or the top of the grid' do
      it 'returns the individual cell that is one square to the right and one square above the supplied co-ordinates' do
        expect(grid.top_right_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the right side of the grid' do
      it 'returns no cell' do
        expect(grid.top_right_neighbour(max_index, 3)).to be_nil
      end
    end

    context 'when on the top row of the grid' do
      it 'returns no cell' do
        expect(grid.top_right_neighbour(3, 0)).to be_nil
      end
    end
  end

  describe '#left_neighbour' do
    context 'when not on the left side of the grid' do
      it 'returns the individual cell that is one square to the left of the supplied co-ordinates' do
        expect(grid.left_neighbour(3, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(grid.left_neighbour(0, 0)).to be_nil
      end
    end
  end

  describe '#right_neighbour' do
    context 'when not on the right side of the grid' do
      it 'returns the individual cell that is one square to the right of the supplied co-ordinates' do
        expect(grid.right_neighbour(3, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the right side of the grid' do
      it 'returns no cell' do
        expect(grid.right_neighbour(max_index, 0)).to be_nil
      end
    end
  end

  describe '#bottom_left_neighbour' do
    context 'when not on the left side or the bottom of the grid' do
      it 'returns the individual cell that is one square to the left and one square below the supplied co-ordinates' do
        expect(grid.bottom_left_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the left side of the grid' do
      it 'returns no cell' do
        expect(grid.bottom_left_neighbour(0, 3)).to be_nil
      end
    end

    context 'when on the bottom row of the grid' do
      it 'returns no cell' do
        expect(grid.bottom_left_neighbour(3, max_index)).to be_nil
      end
    end
  end

  describe '#bottom_neighbour' do
    context 'when not on the bottom row of the grid' do
      it 'returns the individual cell that is one square below the supplied co-ordinates' do
        expect(grid.bottom_neighbour(0, 0)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the bottom row of the grid' do
      it 'returns no cell' do
        expect(grid.bottom_neighbour(0, max_index)).to be_nil
      end
    end
  end

  describe '#bottom_right_neighbour' do
    context 'when not on the right side or the bottom of the grid' do
      it 'returns the individual cell that is one square to the right and one square below the supplied co-ordinates' do
        expect(grid.bottom_right_neighbour(3, 3)).to be_a GameOfLife::Cell
      end
    end

    context 'when on the right side of the grid' do
      it 'returns no cell' do
        expect(grid.bottom_right_neighbour(max_index, 3)).to be_nil
      end
    end

    context 'when on the bottom row of the grid' do
      it 'returns no cell' do
        expect(grid.bottom_right_neighbour(3, max_index)).to be_nil
      end
    end
  end
end
