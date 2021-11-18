# frozen_string_literal: true

def triangle(a, b, c)
  sides = [a, b, c].sort
  if sides.first == 0 || sides[0] + sides[1] <= sides[2]
    raise TriangleError
  end
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end
