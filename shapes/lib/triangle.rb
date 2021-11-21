# frozen_string_literal: true

def triangle(a, b, c)

  if (a + b <= c || a + c <= b || b + c <= a)
    raise TriangleError
  end

  if (a < 0 || b < 0 || c < 0 )
    raise TriangleError
  end

  if (a == 0 || b == 0 || c == 0)
    raise TriangleError
  end

  if (a == b) && (a == c)
    return :equilateral 
  end

  if (a == b) || (b == c) || (a == c)
    return :isosceles
  end

  if (a != b) && (b != c) && (a != c)
    return :scalene
  end
end

# Error class used in invald_triangle_spec. No need to change this code.
class TriangleError < StandardError
end