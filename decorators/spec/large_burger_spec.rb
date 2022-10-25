# frozen_string_literal: true

require 'large_burger'

RSpec.describe LargeBurger do
  subject(:burger) { described_class.new }

  describe '#cost' do
    it 'costs £7.50' do
      expect(burger.cost).to eq(750)
    end
  end
end
