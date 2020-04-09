# frozen_string_literal: true

require 'lcd'

describe LCD do
  context 'viewing a single digit' do
    let(:zero)  { LCD.new(0) }
    let(:six)   { LCD.new(6) }
    let(:eight) { LCD.new(8) }

    it 'should render a 0' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        | |
        |_|
      SQUIGGLY_HEREDOC

      expect(zero.render).to eq(expected)
    end

    it 'should render a 6' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        |_ 
        |_|
      SQUIGGLY_HEREDOC

      expect(six.render).to eq(expected)
    end

    it 'should render an 8' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        |_|
        |_|
      SQUIGGLY_HEREDOC

      expect(eight.render).to eq(expected)
    end
  end

  context 'viewing multiple digits' do
    let(:four_eight_seven) { LCD.new(487) }
    let(:nine_nine_one_three) { LCD.new(9913) }

    it 'should render 487' do
      expected = <<~SQUIGGLY_HEREDOC
            _  _ 
        |_||_|  |
          ||_|  |
      SQUIGGLY_HEREDOC

      expect(four_eight_seven.render).to eq(expected)
    end

    it 'should render 9913' do
      expected = <<~SQUIGGLY_HEREDOC
         _  _     _ 
        |_||_|  | _|
         _| _|  | _|
      SQUIGGLY_HEREDOC

      expect(nine_nine_one_three.render).to eq(expected)
    end
  end
end
