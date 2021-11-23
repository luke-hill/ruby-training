# frozen_string_literal: true

def triangle(a, b, c)
  if a==0 || b==0 || c==0 || a<0 || b<0 || c<0
    raise new.TriangleError
end
  if  array = []
    x, y, z = [a,b,c].sort
    raise TriangleError if x + y <= z
end
  if (a == b) && (a == c) && (b == c)
    :equilateral
  elsif (a == b) && ((a || b) != c)
    :isosceles
  elsif (a == c) && ((a || c) != b)
    :isosceles
  elsif (b == c) && ((b || c) != a)
    :isosceles
  elsif ((a > b) && (a > c)) && (a == (b + c)) &&  ((b || c) != a)
    :rightangle
  elsif ((b > a) && (b > c)) && (b == (a + c)) &&  ((a || c) != b)
    :rightangle
  elsif ((c > a) && (c > b)) && (c == (a + b)) &&  ((a || b) != c)
    :rightangle
  else
    :scalene
end
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end

RSpec.describe 'triangle types' do
  it 'is equilateral when all sides are the same length' do
    expect(triangle(2, 2, 2)).to eq(:equilateral)
    expect(triangle(10, 10, 10)).to eq(:equilateral)
  end

  it 'is isosceles if two sides are equal' do
    expect(triangle(3, 4, 4)).to eq(:isosceles)
    expect(triangle(4, 3, 4)).to eq(:isosceles)
    expect(triangle(4, 4, 3)).to eq(:isosceles)
    expect(triangle(10, 10, 2)).to eq(:isosceles)
  end

  it 'is scalene when no sides are equal' do
    expect(triangle(3, 4, 5)).to eq(:scalene)
    expect(triangle(10, 11, 12)).to eq(:scalene)
    expect(triangle(5, 4, 2)).to eq(:scalene)
  end

  it 'can raise a  error if any angle = 0' do
    expect{(triangle(0, 90, 90)).to raise_error}
    expect{(triangle(90, 0, 90)).to raise_error}
    expect{(triangle(90, 90, 0)).to raise_error}
  end

  it 'throws errors for triangles with a negative side length' do
    expect {triangle(3, 4, -5).to raise_error(TriangleError)}
    expect {triangle(-1, -1, 3).to raise_error(TriangleError)}
    expect {triangle(-2, -4, -2).to raise_error(TriangleError)}
  end

  it 'throws errors for illegal triangles that are not constructable' do
    expect {triangle(1, 1, 3).to raise_error(TriangleError)}
    expect {triangle(2, 4, 2).to raise_error(TriangleError)}
  end
end
