# frozen_string_literal: true

def triangle(a, b, c)
  a, b, c = [a, b, c].sort
  if a <= 0 || a + b <= c
    raise TriangleError
  elsif a == b
    :equilateral
  elsif b == c
    :isosceles
  else
    :scalene
  end
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end
