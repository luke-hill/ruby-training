# frozen_string_literal: true

require 'nim/row'

RSpec.describe Nim::Row do
  let(:row) { described_class.new(amount) }
  let(:amount) { 10 }

  describe '#value' do
    it 'equals the total number of | elements in the row' do
      expect(row.value).to eq(amount)
    end
  end

  describe '#display' do
    it 'shows the number of | elements' do
      expect(row.display).to start_with('| ' * amount)
    end

    it 'shows the value at the end in brackets' do
      expect(row.display).to end_with("(#{amount})")
    end
  end
end
