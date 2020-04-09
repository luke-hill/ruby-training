require 'lcd'

describe LCD do
  context 'viewing multiple lowercase letters from a-f' do
    let(:acb) { LCD.new('acb') }
    let(:fed) { LCD.new('fed') }

    it 'should render acb' do
      expected = <<~SQUIGGLY_HEREDOC
         _       
         _| _ |_ 
        |_||_ |_|
      SQUIGGLY_HEREDOC

      expect( acb.render ).to eq( expected )
    end

    it 'should render fed' do
      expected = <<~SQUIGGLY_HEREDOC
         _  _    
        |_ |_  _|
        |  |_ |_|
      SQUIGGLY_HEREDOC

      expect( fed.render ).to eq( expected )
    end
  end
end
