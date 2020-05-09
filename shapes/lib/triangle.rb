# frozen_string_literal: true

def triangle(a, b, c)
  case
    when [a,b,c].select { |side| side <= 0}.size > 0
      raise TriangleError

    when a + b <= c || b + c <= a || a + c <= b
      raise TriangleError

    when  a == b && b == c
      :equilateral

    when (a == b && c != b) || (a == c && b != c) || (b == c && a != c)
      :isosceles
      
    when  a != b && b != c && c != a
      :scalene
  end
end

# Error class used in invalid_triangle_spec. No need to change this code.
class TriangleError < StandardError
end
