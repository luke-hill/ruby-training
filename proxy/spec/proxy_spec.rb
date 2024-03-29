# frozen_string_literal: true

require 'proxy'
require 'television'

RSpec.describe Proxy do
  context 'with a TV proxy' do
    subject(:tv_proxy) { described_class.new(Television.new) }

    it 'returns a wrapped object' do
      expect(tv_proxy).to be_a(described_class)
    end

    it 'operates the TV channel button as expected' do
      tv_proxy.channel = 10

      expect(tv_proxy.channel).to eq(10)
    end

    it 'operates the TV power button as expected' do
      tv_proxy.power

      expect(tv_proxy).to be_on
    end

    it 'handles invalid messages' do
      expect { tv_proxy.no_such_method }.to raise_error(NoMethodError)
    end

    it 'records messages sent to the tv' do
      tv_proxy.power
      tv_proxy.channel = 10

      expect(tv_proxy.messages).to eq(%i[power channel=])
    end

    it 'reports proxy methods that have been called' do
      tv_proxy.power

      expect(tv_proxy).to be_called(:power)
    end

    it 'does not report proxy methods that have not been called' do
      tv_proxy.channel = 10

      expect(tv_proxy).not_to be_called(:power)
    end

    it 'can count if a method has not been called' do
      tv_proxy.power

      expect(tv_proxy.number_of_times_called(:on?)).to eq(0)
    end

    it 'can count if a method has been called once' do
      tv_proxy.channel = 48

      expect(tv_proxy.number_of_times_called(:channel=)).to eq(1)
    end

    it 'can count if a method has been called multiple times' do
      2.times { tv_proxy.power }
      tv_proxy.channel = 48
      3.times { tv_proxy.power }

      expect(tv_proxy.number_of_times_called(:power)).to eq(5)
    end
  end

  context 'with a string proxy' do
    let(:string_proxy) { described_class.new('Ruby Training 2021 and onwards') }

    it 'returns a wrapped object' do
      expect(string_proxy).to be_a(described_class)
    end

    it 'can perform basic string methods' do
      result = string_proxy.split

      expect(result).to eq(%w[Ruby Training 2021 and onwards])
    end

    it 'records messages sent to the string' do
      string_proxy.upcase
      string_proxy.split

      expect(string_proxy.messages).to eq(%i[upcase split])
    end

    it 'handles invalid messages' do
      expect { string_proxy.no_such_method }.to raise_error(NoMethodError)
    end

    it 'reports proxy methods that have been called' do
      string_proxy.capitalize

      expect(string_proxy).to be_called(:capitalize)
    end

    it 'does not report proxy methods that have not been called' do
      string_proxy.to_i

      expect(string_proxy).not_to be_called(:capitalize)
    end

    it 'can count if a method has not been called' do
      string_proxy.to_i

      expect(string_proxy.number_of_times_called(:capitalize)).to eq(0)
    end

    it 'can count if a method has been called once' do
      string_proxy.capitalize

      expect(string_proxy.number_of_times_called(:capitalize)).to eq(1)
    end

    it 'can count if a method has been called multiple times' do
      2.times { string_proxy.capitalize }
      string_proxy.to_i
      3.times { string_proxy.capitalize }

      expect(string_proxy.number_of_times_called(:capitalize)).to eq(5)
    end
  end
end
