# frozen_string_literal: true

require 'triangle' # RSpec automatically adds `lib/` to the LOAD_PATH
# edit lib/triangle.rb to fix these tests

RSpec.describe 'handling errors' do
  # The first triangle spec did not deal with handling errors.
  # Let's do that part now.
  it 'throws errors for illegal triangles' do
    expect { triangle(0, 0, 0) }.to raise_error(TriangleError)
    expect { triangle(3, 4, -5) }.to raise_error(TriangleError)
    expect { triangle(1, 1, 3) }.to raise_error(TriangleError)
    expect { triangle(2, 4, 2) }.to raise_error(TriangleError)
  end
end