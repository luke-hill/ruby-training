# frozen_string_literal: true

RSpec.describe 'Converting items to Strings' do
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

  it 'returns a string representation using `#to_s`' do
    not_like_a_string = NotLikeAString.new

    expect(not_like_a_string.to_s).to eq(__)
  end

  it 'cannot use normal objects in place of strings by using `#to_s`' do
    expect { File.exist?(NotLikeAString.new) }.to raise_error(__)
  end

  it 'also returns a string representation using `#to_str`' do
    like_a_string = LikeAString.new

    expect(like_a_string.to_str).to eq(__)
  end

  it 'can be used in place of a string by using `#to_str`' do
    expect(File.exist?(LikeAString.new)).to eq(__)
  end

  def acts_like_a_string?(string)
    string = string.to_str if string.respond_to?(:to_str)
    string.is_a?(String)
  end

  it 'can check for `#to_str` as a normal method in user-defined code' do
    expect(acts_like_a_string?(NotLikeAString.new)).to eq(__)
    expect(acts_like_a_string?(LikeAString.new)).to eq(__)
  end
end
