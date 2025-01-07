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

  describe '#rule2' do
    let(:cell) { alive_cell }
    let(:neighbours) do
      [
        alive_cell, dead_cell, dead_cell,
        alive_cell,            dead_cell,
        alive_cell, dead_cell, dead_cell
      ]
    end

    it 'is TBD' do
      expect(rules_engine.rule2).to eq(:TBD)
    end
  end

  describe '#rule3' do
    let(:cell) { alive_cell }
    let(:neighbours) do
      [
        alive_cell, dead_cell, dead_cell,
        alive_cell,            dead_cell,
        alive_cell, dead_cell, dead_cell
      ]
    end

    it 'is TBD' do
      expect(rules_engine.rule3).to eq(:TBD)
    end
  end
end
