RSpec.describe 'to_str' do
  class NotTreatableAsString
    def to_s
      'non-string-like'
    end
  end

  class TreatableAsString
    def to_s
      'string-like'
    end

    def to_str
      to_s
    end
  end

  it 'returns a string representation using to_s' do
    not_like_a_string = NotTreatableAsString.new
    expect(not_like_a_string.to_s).to eq(__)
  end

  it "can't use a normal object in place of a string using to_s" do
    expect { File.exist?(NotTreatableAsString.new) }.to raise_error(__)
  end

  it 'also returns a string representation using to_str' do
    like_a_string = TreatableAsString.new
    expect(like_a_string.to_str).to eq(__)
  end

  it 'can be used in place of a string using to_str' do
    expect(File.exist?(TreatableAsString.new)).to eq(__)
  end

  def acts_like_a_string?(string)
    string = string.to_str if string.respond_to?(:to_str)
    string.is_a?(String)
  end

  it 'can check for to_str in user-defined code' do
    expect(acts_like_a_string?(NotTreatableAsString.new)).to eq(__)
    expect(acts_like_a_string?(TreatableAsString.new)).to eq(__)
  end
end
