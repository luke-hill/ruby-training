# frozen_string_literal: true

require 'lcd'

describe LCD do
  context 'when viewing letters from a-f' do
    let(:acb) { described_class.new('acb') }
    let(:fed) { described_class.new('fed') }

    it 'renders acb' do
      expected = <<~SQUIGGLY_HEREDOC
         _       
         _| _ |_ 
        |_||_ |_|
      SQUIGGLY_HEREDOC

      expect(acb.render).to eq(expected)
    end

    it 'renders fed' do
      expected = <<~SQUIGGLY_HEREDOC
         _  _    
        |_ |_  _|
        |  |_ |_|
      SQUIGGLY_HEREDOC

      expect(fed.render).to eq(expected)
    end
  end
end
