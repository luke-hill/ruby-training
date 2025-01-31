# frozen_string_literal: true

RSpec.describe GameOfLife::Rules do
  subject(:rules_engine) { described_class.new(cell, neighbours) }

  let(:alive_cell) { instance_double(GameOfLife::Cell, alive?: true, dead?: false) }
  let(:dead_cell) { instance_double(GameOfLife::Cell, alive?: false, dead?: true) }

  describe '#become_alive?' do
    subject { rules_engine.become_alive? }

    context 'when the cell is alive' do
      let(:cell) { alive_cell }

      context 'when there are enough neighbours' do
        let(:neighbours) do
          [
            alive_cell, dead_cell, dead_cell,
            alive_cell,            dead_cell,
            alive_cell, dead_cell, dead_cell
          ]
        end

        it { is_expected.to be true }
      end

      context 'when there are too many neighbours' do
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

    context 'when the cell is dead' do
      let(:neighbours) do
        [
          alive_cell, dead_cell, dead_cell,
          alive_cell,            dead_cell,
          alive_cell, dead_cell, dead_cell
        ]
      end

      context 'when there are 3 neighbours' do
        let(:cell) { dead_cell }

        it { is_expected.to be true }
      end

      context 'when there are not 3 neighbours' do
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
end
