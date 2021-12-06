# frozen_string_literal: true

require 'lcd'

describe LCD do
  context 'when viewing a single digit' do
    let(:zero)  { described_class.new(0) }
    let(:six)   { described_class.new(6) }
    let(:eight) { described_class.new(8) }

    it 'renders a 0' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        | |
        |_|
      SQUIGGLY_HEREDOC

      expect(zero.render).to eq(expected)
    end

    it 'renders a 6' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        |_ 
        |_|
      SQUIGGLY_HEREDOC

      expect(six.render).to eq(expected)
    end

    it 'renders an 8' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        |_|
        |_|
      SQUIGGLY_HEREDOC

      expect(eight.render).to eq(expected)
    end
  end

  context 'when viewing multiple digits' do
    let(:four_eight_seven) { described_class.new(487) }
    let(:nine_nine_one_three) { described_class.new(9913) }
    let(:all_digits) { described_class.new(9876543210) }

    it 'renders 487' do
      expected = <<~SQUIGGLY_HEREDOC
            _  _ 
        |_||_|  |
          ||_|  |
      SQUIGGLY_HEREDOC

      expect(four_eight_seven.render).to eq(expected)
    end

    it 'renders 9913' do
      expected = <<~SQUIGGLY_HEREDOC
         _  _     _ 
        |_||_|  | _|
         _| _|  | _|
      SQUIGGLY_HEREDOC

      expect(nine_nine_one_three.render).to eq(expected)
    end

    it 'renders all digits' do
      expected = <<~SQUIGGLY_HEREDOC
         _  _  _  _  _     _  _     _ 
        |_||_|  ||_ |_ |_| _| _|  || |
         _||_|  ||_| _|  | _||_   ||_|
      SQUIGGLY_HEREDOC

      expect(all_digits.render).to eq(expected)
    end
  end
end
