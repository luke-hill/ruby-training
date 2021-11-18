# frozen_string_literal: true

def triangle(a, b, c)
  # Below code will check errors for
  # triangles with side length 0
  # triangles with a negative side length
  # illegal triangles that are not constructable
  sides = [a, b, c].sort
  if sides.first <= 0 || sides[0] + sides[1] <= sides[2]
    raise TriangleError
  end
  # Below code will check for
  # equilateral triangles
  # isosceles triangles
  # scalene triangles
  case [a, b, c].uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else        :scalene
  end
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end
