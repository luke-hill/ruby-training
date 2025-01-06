# frozen_string_literal: true

RSpec.describe GameOfLife::Rules do
  subject(:rules_engine) { described_class.new(cell, neighbours) }

  let(:alive_cell) { instance_double(GameOfLife::Cell, alive?: true, dead?: false) }
  let(:dead_cell) { instance_double(GameOfLife::Cell, alive?: false, dead?: true) }

  describe '#rule1' do
    let(:cell) { alive_cell }
    let(:neighbours) do
      [
        alive_cell, dead_cell, dead_cell,
        alive_cell,            dead_cell,
        alive_cell, dead_cell, dead_cell
      ]
    end

    it 'is TBD' do
      expect(rules_engine.rule1).to eq(:TBD)
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
