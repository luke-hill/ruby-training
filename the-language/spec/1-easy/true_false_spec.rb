RSpec.describe 'true/truthy and false/falsy' do
  def truth_tester(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  it 'treats true as truthy' do
    expect(truth_tester(true)).to eq(:true_stuff)
  end

  it 'treats false as falsey' do
    expect(truth_tester(false)).to eq(:false_stuff)
  end

  it 'treats nil as falsey' do
    expect(truth_tester(nil)).to eq(:false_stuff)
  end

  it 'treats everything else as truthy' do
    expect(truth_tester(1)).to eq(:true_stuff)
    expect(truth_tester(0)).to eq(:true_stuff)
    expect(truth_tester([])).to eq(:true_stuff)
    expect(truth_tester({})).to eq(:true_stuff)
    expect(truth_tester('Strings')).to eq(:true_stuff)
    expect(truth_tester('')).to eq(:true_stuff)
  end

    it 'can match true exactly with be(true) or eq(true) matchers' do
      expect(true).to be(true)
      expect(true).to eq(true)
    end

    it 'can match false exactly with be(false) or eq(false) matchers' do
      expect(false).to be(false)
      expect(false).to eq(false)
    end
  end
end
