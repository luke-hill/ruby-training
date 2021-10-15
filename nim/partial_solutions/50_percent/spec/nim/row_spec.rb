# frozen_string_literal: true

require 'nim/row'

RSpec.describe Nim::Row do
  let(:row) { described_class.new(amount) }
  let(:small_amount) { 5 }
  let(:large_amount) { 10 }

  describe '#display' do
    context 'with a small value' do
      let(:amount) { small_amount }

      it 'will show the number of | elements' do
        expect(row.display).to start_with('| ' * amount)
      end

      it 'will show the value at the end in brackets' do
        expect(row.display).to end_with("(#{amount})")
      end
    end

    context 'with a large value' do
      let(:amount) { large_amount }

      it 'equals the maximum displayed amount' do
        expect(row.display).to start_with('| | | ... | | | ')
      end

      it 'will show the value at the end in brackets' do
        expect(row.display).to end_with("(#{amount})")
      end
    end
  end
end
