# frozen_string_literal: true

require 'lcd'

describe LCD do
  context 'with parameter modifications' do
    context 'viewing digits with modified width' do
      let(:eight) { described_class.new(8, width: 2) }
      let(:nine_one_three) { described_class.new(913, width: 4) }

      it 'should render a widened 8' do
        expected = <<~SQUIGGLY_HEREDOC
           __ 
          |__|
          |__|
        SQUIGGLY_HEREDOC

        expect(eight.render).to eq(expected)
      end

      it 'should render a widened 913' do
        expected = <<~SQUIGGLY_HEREDOC
           ____        ____ 
          |____|     | ____|
           ____|     | ____|
        SQUIGGLY_HEREDOC

        expect(nine_one_three.render).to eq(expected)
      end
    end

    context 'viewing digits with modified height' do
      let(:four) { described_class.new(4, height: 3) }
      let(:eight_seven) { described_class.new(87, height: 4) }

      it 'should render a heightened 2' do
        expected = <<~SQUIGGLY_HEREDOC
             
          | |
          | |
          |_|
            |
            |
            |
        SQUIGGLY_HEREDOC

        expect(four.render).to eq(expected)
      end

      it 'should render a heightened 87' do
        expected = <<~SQUIGGLY_HEREDOC
           _  _ 
          | |  |
          | |  |
          | |  |
          |_|  |
          | |  |
          | |  |
          | |  |
          |_|  |
        SQUIGGLY_HEREDOC

        expect(eight_seven.render).to eq(expected)
      end
    end

    context 'viewing digits with modified width AND height' do
      let(:eight) { described_class.new(8, height: 3, width: 2) }
      let(:four_one_nine) { described_class.new(419, height: 5, width: 7) }

      it 'should render a heightened AND widened 8' do
        expected = <<~SQUIGGLY_HEREDOC
           __ 
          |  |
          |  |
          |__|
          |  |
          |  |
          |__|
        SQUIGGLY_HEREDOC

        expect(eight.render).to eq(expected)
      end

      it 'should render a heightened AND widened 47189' do
        expected = <<~SQUIGGLY_HEREDOC
                             _______ 
          |       |        ||       |
          |       |        ||       |
          |       |        ||       |
          |       |        ||       |
          |_______|        ||_______|
                  |        |        |
                  |        |        |
                  |        |        |
                  |        |        |
                  |        | _______|
        SQUIGGLY_HEREDOC

        expect(four_one_nine.render).to eq(expected)
      end
    end

    context 'viewing letters from a-f with modified width AND height' do
      let(:abcdef) { LCD.new('abcfed', height: 4, width: 6) }

      it 'should render a heightened AND widened abcdef' do
        expected = <<~SQUIGGLY_HEREDOC
           ______                  ______  ______         
                 ||               |       |              |
                 ||               |       |              |
                 ||               |       |              |
           ______||______  ______ |______ |______  ______|
          |      ||      ||       |       |       |      |
          |      ||      ||       |       |       |      |
          |      ||      ||       |       |       |      |
          |______||______||______ |       |______ |______|
        SQUIGGLY_HEREDOC

        expect(abcdef.render).to eq(expected)
      end
    end
  end
end
