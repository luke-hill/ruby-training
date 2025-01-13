# frozen_string_literal: true

RSpec.describe GameOfLife::Grid do
  subject(:grid) { described_class.new(grid_size) }

  let(:grid_size) { 10 }
  let(:max_index) { grid_size - 1 }
  let(:alive_cell) { instance_double(GameOfLife::Cell, alive?: true, dead?: false) }
  let(:dead_cell) { instance_double(GameOfLife::Cell, alive?: false, dead?: true) }

  describe '#initialize' do
    it 'has an initial state containing cells' do
      expect(grid.cells).to be_an(Array)
    end

    it 'contains a series of GameOfLife::Cells' do
      expect(grid.cells.first).to all be_a(GameOfLife::Cell)
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

    context 'when at the left of the grid' do
      it 'returns 5 neighbours' do
        expect(grid.neighbours(0, 3).length).to eq(5)
      end
    end

    context 'when in the centre of the grid' do
      it 'returns the full 8 neighbours' do
        expect(grid.neighbours(3, 3).length).to eq(8)
      end
    end

    context 'when at the right of the grid' do
      it 'returns 5 neighbours' do
        expect(grid.neighbours(max_index, 3).length).to eq(5)
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
end
