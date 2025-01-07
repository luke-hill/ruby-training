# frozen_string_literal: true

RSpec.describe GameOfLife::Rules do
  subject(:rules_engine) { described_class.new(cell, neighbours) }

  let(:alive_cell) { instance_double(GameOfLife::Cell, alive?: true, dead?: false) }
  let(:dead_cell) { instance_double(GameOfLife::Cell, alive?: false, dead?: true) }

  describe '#survival' do
    subject { rules_engine.survival }

    let(:neighbours) do
      [
        alive_cell, dead_cell, dead_cell,
        alive_cell,            dead_cell,
        alive_cell, dead_cell, dead_cell
      ]
    end

    context 'when the cell is dead' do
      let(:cell) { dead_cell }

      it { is_expected.to be false }
    end

    context 'when the cell is alive and there are enough neighbours' do
      let(:cell) { alive_cell }

      it { is_expected.to be true }
    end

    context 'when the cell is alive and there are too many neighbours' do
      let(:cell) { alive_cell }

      let(:neighbours) do
        [
          alive_cell, alive_cell, dead_cell,
          alive_cell,             dead_cell,
          alive_cell, alive_cell, dead_cell
        ]
      end

      it { is_expected.to be false }
    end
  end

  #   Rule3: Any DEAD cell with exactly three LIVE neighbours becomes a LIVE cell, as if by reproduction.

  describe '#reproduction' do
    subject { rules_engine.reproduction }

    let(:neighbours) do
      [
        alive_cell, dead_cell, dead_cell,
        alive_cell,            dead_cell,
        alive_cell, dead_cell, dead_cell
      ]
    end

    context 'when the cell is alive' do
      let(:cell) { alive_cell }

      it { is_expected.to be false }
    end

    context 'when the cell is dead and there are 3 neighbours' do
      let(:cell) { dead_cell }

      it { is_expected.to be true }
    end

    context 'when the cell is dead and there are not 3 neighbours' do
      let(:cell) { dead_cell }
      let(:neighbours) do
        [
          alive_cell, alive_cell, dead_cell,
          alive_cell,             dead_cell,
          alive_cell, alive_cell, dead_cell
        ]
      end

      it { is_expected.to be false }
    end
  end
end
