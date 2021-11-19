# frozen_string_literal: true

require 'triangle' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/triangle.rb to fix these tests

RSpec.describe 'triangle types' do
  context 'when valid' do
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
  end

  context 'when invalid' do
    it 'throws errors for triangles with side length 0' do
      expect { triangle(3, 4, 0) }.to raise_error(TriangleError)
      expect { triangle(0, 1, 0) }.to raise_error(TriangleError)
      expect { triangle(0, 0, 0) }.to raise_error(TriangleError)
    end

    it 'throws errors for triangles with a negative side length' do
      expect { triangle(3, 4, -5) }.to raise_error(TriangleError)
      expect { triangle(-1, -1, 3) }.to raise_error(TriangleError)
      expect { triangle(-2, -4, -2) }.to raise_error(TriangleError)
    end

    it 'throws errors for illegal triangles that are not constructible' do
      expect { triangle(1, 1, 3) }.to raise_error(TriangleError)
      expect { triangle(2, 4, 2) }.to raise_error(TriangleError)
    end
  end
end
