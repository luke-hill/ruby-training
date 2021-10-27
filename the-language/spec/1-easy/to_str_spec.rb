RSpec.describe 'to_str' do
  class NotLikeAString
    def to_s
      'non-string-like'
    end
  end

  class LikeAString
    def to_s
      'string-like'
    end

    def to_str
      to_s
    end
  end

  it 'returns a string representation using to_s' do
    not_like_a_string = NotLikeAString.new

    expect(not_like_a_string.to_s).to eq('non-string-like')
  end

  it "can't use a normal object in place of a string using to_s" do
    expect { File.exist?(NotLikeAString.new) }.to raise_error(TypeError)
  end

  it 'also returns a string representation using to_str' do
    like_a_string = LikeAString.new
   expect(like_a_string.to_str).to eq('string-like')
   end

  it 'can be used in place of a string using to_str' do
    expect(File.exist?(LikeAString.new)).to eq(false)
  end

  def acts_like_a_string?(string)
    string = string.to_str if string.respond_to?(:to_str)
    string.is_a?(String)
  end

  it 'can check for to_str in user-defined code' do
    expect(acts_like_a_string?(NotLikeAString.new)).to eq(false)
    expect(acts_like_a_string?(LikeAString.new)).to eq(true)
  end
end
