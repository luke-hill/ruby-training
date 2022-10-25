# frozen_string_literal: true

require 'burger'
require 'large_burger'
require 'cheese_burger'

RSpec.describe Burger do
  context 'with a regular burger' do
    subject(:burger) { 'FIX ME' }

    describe '#cost' do
      it 'costs £5' do
        expect(burger.cost).to eq(500)
      end
    end
  end

  context 'with added cheese' do
    subject(:burger) { 'FIXME' }

    describe '#cost' do
      it 'costs £5.60' do
        expect(burger.cost).to eq(560)
      end
    end
  end

  context 'with an extra burger' do
    subject(:burger) { 'FIXME' }

    describe '#cost' do
      it 'costs £7.50' do
        expect(burger.cost).to eq(750)
      end
    end
  end

  context 'with an extra burger AND added cheese' do
    subject(:burger) { 'FIXME' }

    describe '#cost' do
      it 'costs £8.10' do
        expect(burger.cost).to eq(810)
      end
    end
  end
end
