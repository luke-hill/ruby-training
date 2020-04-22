

require 'television'

RSpec.describe Television do
  let(:tv) { Television.new }

  it 'turns on' do
    tv.power

    expect(tv).to be_on
  end

  it 'also turns off' do
    tv.power
    tv.power

    expect(tv).not_to be_on
  end

  it 'turns back on and off' do
    tv.power
    tv.power
    tv.power

    expect(tv).to be_on

    tv.power

    expect(tv).not_to be_on
  end

  it 'can set a channel' do
    tv.channel = 11

    expect(tv.channel).to eq(11)
  end
end
