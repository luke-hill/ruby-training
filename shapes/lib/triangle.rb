# frozen_string_literal: true

def triangle(a, b, c)
  return :equilateral if a == b && a == c 
  return :isosceles if a == b || b == c || a == c
  return :scalene if a != b && b != c && a != c
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end
