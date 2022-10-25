# frozen_string_literal: true

require 'burger'

RSpec.describe Burger do
  describe '#cost' do
    context 'with a regular burger' do
      subject(:burger) { 'FIXME' }

      it 'costs £5' do
        expect(burger.cost).to eq(500)
      end
    end

    context 'with added cheese' do
      subject(:burger) { 'FIXME' }

      it 'costs £5.60' do
        expect(burger.cost).to eq(560)
      end
    end

    context 'with an extra burger' do
      subject(:burger) { 'FIXME' }

      it 'costs £7.50' do
        expect(burger.cost).to eq(750)
      end
    end

    context 'with an extra burger AND added cheese' do
      subject(:burger) { 'FIXME' }

      it 'costs £8.10' do
        expect(burger.cost).to eq(810)
      end
    end

    context 'with two extra burgers' do
      subject(:burger) { 'FIXME' }

      it 'costs £10' do
        expect(burger.cost).to eq(1000)
      end
    end

    context 'with double cheese' do
      subject(:burger) { 'FIXME' }

      it 'costs £6.20' do
        expect(burger.cost).to eq(620)
      end
    end

    context 'with one extra burger, double cheese and an avocado' do
      subject(:burger) { 'FIXME' }

      it 'costs £10.70' do
        expect(burger.cost).to eq(1070)
      end
    end
  end

  describe '#healthy?' do
    context 'with a regular burger' do
      subject(:burger) { 'FIXME' }

      it { is_expected.not_to be_healthy }
    end

    context 'with an avocado' do
      subject(:burger) { 'FIXME' }

      it { is_expected.to be_healthy }
    end
  end
end
