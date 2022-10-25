# frozen_string_literal: true

require 'cheese_burger'

RSpec.describe CheeseBurger do
  subject(:burger) { described_class.new }

  describe '#cost' do
    it 'costs £5.60' do
      expect(burger.cost).to eq(560)
    end
  end
end
