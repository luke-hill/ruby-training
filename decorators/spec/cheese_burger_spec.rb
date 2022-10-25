# frozen_string_literal: true

require 'cheese_burger'

RSpec.describe CheeseBurger do
  subject(:cheese_burger) { described_class.new }

  describe '#cost' do
    it 'costs £5.60' do
      expect(cheese_burger.cost).to eq(560)
    end
  end
end
