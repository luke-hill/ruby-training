# frozen_string_literal: true

RSpec.describe GameOfLife::Cell do
  subject(:cell) { described_class.new }

  it { is_expected.to be_alive }
  it { is_expected.not_to be_dead }

  describe '#alive!' do
    it 'sets the cell to be alive' do
      cell.alive!

      expect(cell).to be_alive
    end
  end

  describe '#dead!' do
    it 'sets the cell to be dead' do
      cell.dead!

      expect(cell).to be_dead
    end
  end

  describe '#inspect' do
    context 'when the cell is alive' do
      it 'shows an alive emoji as the inspect helper' do
        expect(cell.inspect).to eq("\u{1f642}")
      end
    end

    context 'when the cell is dead' do
      before { cell.dead! }

      it 'shows an alive emoji as the inspect helper' do
        expect(cell.inspect).to eq("\u{1f480}")
      end
    end
  end
end
