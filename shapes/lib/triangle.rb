# frozen_string_literal: true

def triangle(a, b, c)
  raise TriangleError if a<=0 || b<=0 || c<=0
  raise TriangleError if a+b<=c || b+c<=a || a+c<=b
  if a==b && a==c
    :equilateral
  elsif a==b || b==c || a==c
    :isosceles
  else
    :scalene
  end
end

# Error class used in triangle_spec. No need to change this code.
class TriangleError < StandardError
end

