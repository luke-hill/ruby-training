# frozen_string_literal: true

require 'runtime_method_generator'

RSpec.describe RuntimeMethodGenerator do
  let(:metaprogram) { subject }

  describe '#add_a_method' do
    it 'generates a method' do
      expect(metaprogram.add_a_method).not_to raise_error
    end

    it 'permits the newly generated method to be called' do
      metaprogram.add_a_method

      expect(metaprogram.funky_method).to eq(:funky)
    end
  end

  describe '#add_custom_method' do
    it 'must supply an argument' do
      expect(metaprogram.add_custom_method).to raise_error(ArgumentError)
    end

    it 'permits the newly generated method to be called' do
      metaprogram.add_custom_method(:foo)

      expect(metaprogram).to respond_to(:foo)
    end

    it 'permits overwriting of previously defined methods' do
      metaprogram.add_custom_method(:predefined)

      expect(metaprogram.predefined).not_to eq(:predefined)
    end
  end
end
