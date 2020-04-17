# frozen_string_literal: true

require 'triangle' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/triangle.rb to fix these tests

RSpec.describe 'handling errors' do
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

  it 'throws errors for illegal triangles that are not constructable' do
    expect { triangle(1, 1, 3) }.to raise_error(TriangleError)
    expect { triangle(2, 4, 2) }.to raise_error(TriangleError)
  end
end
