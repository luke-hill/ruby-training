# frozen_string_literal: true

def quadrilateral(a, b, c, d)
  a, b, c, d = [a, b, c, d].sort
  if a <= 0 || a + b + c + d != 360
    raise QuadrilateralError
  elsif a == d
    [:square, :rectangle]
  elsif a == b && c == d
    [:parallelogram, :rhombus]
  elsif a != c && b != d
    [:quadrilateral]
  else a != d
    [:quadrilateral]
  end
end

# Error class used in invalid_quadrilateral_spec. No need to change this code.
class QuadrilateralError < StandardError
end
