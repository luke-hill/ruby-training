# frozen_string_literal: true

def triangle(a, b, c)
  raise TriangleError if a==0 || b==0 || c==0
  if a==b && a==c
    :equilateral
  elsif a==b || b==c || a==c
    :isosceles
  else
    :scalene
  end
end


# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end

