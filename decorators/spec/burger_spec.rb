# frozen_string_literal: true

require 'burger'

RSpec.describe Burger do
  describe '#cost' do
    it 'costs £5' do
      expect(subject.cost).to eq(500)
    end
  end
end
