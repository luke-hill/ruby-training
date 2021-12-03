# frozen_string_literal: true

require 'bottles'

describe Bottles do
  let(:song) { subject }

  it 'can sing a typical verse' do
    expected = "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n"
    expect(song.verse(8)).to eq(expected)
  end

  it 'can sing another typical verse' do
    expected = "3 bottles of beer on the wall, 3 bottles of beer.\nTake one down and pass it around, 2 bottles of beer on the wall.\n"
    expect(song.verse(3)).to eq(expected)
  end

  it 'can sing about 1 bottle' do
    expected = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    expect(song.verse(1)).to eq(expected)
  end

  it 'can sing about 2 bottles' do
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    expect(song.verse(2)).to eq(expected)
  end

  it 'can sing about no more bottles' do
    expected = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    expect(song.verse(0)).to eq(expected)
  end

  it 'can string a few verses together' do
    expected = "8 bottles of beer on the wall, 8 bottles of beer.\nTake one down and pass it around, 7 bottles of beer on the wall.\n\n7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 6 bottles of beer on the wall.\n\n6 bottles of beer on the wall, 6 bottles of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n\n"
    expect(song.verses(8, 6)).to eq(expected)
  end

  it 'can sing the whole song' do
    skip
    expect(song.sing).to eq(song.verses(99, 0))
  end
end
