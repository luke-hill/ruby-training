# frozen_string_literal: true

def quadrilateral(a, b, c, d)
  sum = 360
  return [:square, :rectangle] if a == b && b == c && c == d
  return [:parallelogram, :rhombus] if a+b != c+d or a+d != b+d or a+d != b+c

end
# Error class used in invalid_quadrilateral_spec. No need to change this code.
class QuadrilateralError < StandardError
end
