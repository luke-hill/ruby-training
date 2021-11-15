# frozen_string_literal: true

require 'television'

RSpec.describe Television do
  subject(:tv) { described_class.new }

  it 'turns on' do
    tv.power

    expect(tv).to be_on
  end

  it 'also turns off' do
    tv.power
    tv.power

    expect(tv).not_to be_on
  end

  it 'can turn itself on then off then back on' do
    tv.power
    tv.power
    tv.power

    expect(tv).to be_on
  end

  it 'can set a channel' do
    tv.channel = 11

    expect(tv.channel).to eq(11)
  end
end
