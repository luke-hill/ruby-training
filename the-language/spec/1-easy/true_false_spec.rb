RSpec.describe 'true/truthy and false/falsy' do
  def truth_tester(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  it 'treats true as truthy' do
    expect(truth_tester(true)).to eq(__)
  end

  it 'treats false as falsey' do
    expect(truth_tester(false)).to eq(__)
  end

  it 'treats nil as falsey' do
    expect(truth_tester(nil)).to eq(__)
  end

  it 'treats everything else as truthy' do
    expect(truth_tester(1)).to eq(__)
    expect(truth_tester(0)).to eq(__)
    expect(truth_tester([])).to eq(__)
    expect(truth_tester({})).to eq(__)
    expect(truth_tester('Strings')).to eq(__)
    expect(truth_tester('')).to eq(__)
  end

  # These are useful, if awkwardly named matchers
  context 'rspec matchers' do
    it 'matches truthy things with be_truthy' do
      pending 'REMOVE THIS LINE TO CONTINUE, ONCE YOU UNDERSTAND THE CODE BELOW'
      expect(true).to be_truthy
      expect(1).to be_truthy
      expect(0).to be_truthy
      expect([]).to be_truthy
      expect({}).to be_truthy
      expect('Strings').to be_truthy
      expect('').to be_truthy
    end

    it 'matches falsey things with be_falsey' do
      pending 'REMOVE THIS LINE TO CONTINUE, ONCE YOU UNDERSTAND THE CODE BELOW'
      expect(false).to be_falsey
      expect(nil).to be_falsey
    end

    it 'can match true exactly with be(true) or eq(true) matchers' do
      expect(true).to be(__)
      expect(true).to eq(__)
    end

    it 'can match false exactly with be(false) or eq(false) matchers' do
      expect(false).to be(__)
      expect(false).to eq(__)
    end
  end
end
