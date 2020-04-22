# frozen_string_literal: true

require 'proxy'
require 'television'

RSpec.describe Proxy do
  context 'with a tv proxy' do
    let(:tv_proxy) { Proxy.new(Television.new) }

    it 'returns a wrapped object' do
      expect(tv_proxy).to be_a(Proxy)
    end

    it 'operates the TV channel button as expected' do
      tv_proxy.channel = 10

      expect(tv_proxy.channel).to eq(10)
    end

    it 'operates the TV power button as expected' do
      tv_proxy.power

      expect(tv_proxy).to be_on
    end

    it 'records messages sent to the tv' do
      tv_proxy.power
      tv_proxy.channel = 10

      expect(tv_proxy.messages).to eq(%i[power channel=])
    end

    it 'handles invalid messages' do
      expect { tv_proxy.no_such_method }.to raise_error(NoMethodError)
    end

    it 'reports proxy methods that have been called' do
      tv_proxy.power

      expect(tv_proxy.called?(:power)).to be_truthy
    end

    it 'does not report proxy methods that have not been called' do
      tv_proxy.channel = 10

      expect(tv_proxy.called?(:power)).to be_falsey
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
      tv_proxy.power
      tv_proxy.power
      tv_proxy.channel = 48
      tv_proxy.power

      expect(tv_proxy.number_of_times_called(:power)).to eq(3)
    end
  end

  context 'with a string proxy' do
    let(:string_proxy) { Proxy.new('Code Mash 2009') }

    it 'returns a wrapped object' do
      expect(string_proxy).to be_a(Proxy)
    end

    it 'can perform basic string methods' do
      string_proxy.upcase!
      result = string_proxy.split

      expect(result).to eq(%w[CODE MASH 2009])
    end

    it 'records messages sent to the string' do
      string_proxy.upcase
      string_proxy.split

      expect(string_proxy.messages).to eq(%i[upcase split])
    end
  end
end
