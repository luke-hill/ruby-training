# frozen_string_literal: true

require 'bottles'

describe Bottles do
  let(:song) { subject }

  it 'can sing a typical verse' do
    def verse(bottles_08)
    expected = "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n"
    end  
  end

  it 'can sing another typical verse' do
    def verse(bottles_03)
    expected = "3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n"
    end
  end

  it 'can sing about 1 bottle' do
    def verse(bottles_01)
    expected = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  it 'can sing about 2 bottles' do
    def verse(bottles_02)
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  it 'can sing about no more bottles' do
    def verse(bottles_00)
    expected = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  it 'can string a few verses together' do
    def verse(bottles_876)
    expected = "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n\n7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 6 bottles of beer on the wall.\n\n6 bottles of beer on the wall, 6 bottles of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n\n"
    end
  end

  it 'can sing the whole song' do
    def verses(bottles_99_0)
    end
  end
end
