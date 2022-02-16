# frozen_string_literal: true

def triangle(a, b, c)
  if a==b && a==c
    :equilateral
  else
    :isosceles
  end
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end
