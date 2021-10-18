RSpec.describe 'true/truthy and false/falsy' do
  def truth_value(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  it 'treats true as truthy' do
    expect(truth_value(true)).to eq(__)
  end

  it 'treats false as falsey' do
    expect(truth_value(false)).to eq(__)
  end

  it 'treats nil as falsey' do
    expect(truth_value(nil)).to eq(__)
  end

  it 'treats everything else as truthy' do
    expect(truth_value(1)).to eq(__)
    expect(truth_value(0)).to eq(__)
    expect(truth_value([])).to eq(__)
    expect(truth_value({})).to eq(__)
    expect(truth_value('Strings')).to eq(__)
    expect(truth_value('')).to eq(__)
  end

  # These are useful, if awkwardly named matchers
  context 'rspec matchers' do
    it 'matches truthy things with be_truthy' do
      # Remove this line to continue
      pending 'REMOVE THIS LINE TO CONTINUE, ONCE YOU UNDERSTAND THE CODE BELOW'
      expect(true).to be_truthy
      expect(1).to be_truthy
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

    it 'can match false exactly with be(false) or be(true) matchers' do
      expect(false).to be(__)
      expect(false).to eq(__)
    end
  end
end
