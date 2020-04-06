# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  # You need to write this method
end

RSpec.describe "scorign a game of greed" do
  it "scores an empty list as 0" do
    expect( score([]) ).to eq( 0 )
  end

  it "scores a single 5 as 50" do
    expect( score([5]) ).to eq( 50 )
  end

  it "scores a single 1 as 100" do
    expect( score([1]) ).to eq( 100 )
  end

  it "scores multiple 1s and 5s as a sum of the individual scores" do
    expect( score([1,5,5,1]) ).to eq( 300 )
  end

  it "scores 2s, 3s, 4s, and 6s as 0" do
    expect( score([2,3,4,6]) ).to eq( 0 )
  end

  it "scores triple 1 as 1000" do
    expect( score([1,1,1]) ).to eq( 1000 )
  end

  it "scores other triples as face value * 100" do
    expect( score([2,2,2]) ).to eq( 200 )
    expect( score([3,3,3]) ).to eq( 300 )
    expect( score([4,4,4]) ).to eq( 400 )
    expect( score([5,5,5]) ).to eq( 500 )
    expect( score([6,6,6]) ).to eq( 600 )
  end

  it "can score mixed throws" do
    expect( score([2,5,2,2,3]) ).to eq( 250 )
    expect( score([5,5,5,5]) ).to eq( 550 )
    expect( score([1,1,1,1]) ).to eq( 1100 )
    expect( score([1,1,1,1,1]) ).to eq( 1200 )
    expect( score([1,1,1,5,1]) ).to eq( 1150 )
  end

end

