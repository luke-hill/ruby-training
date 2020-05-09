# frozen_string_literal: true

def quadrilateral(a, b, c, d)
  case
    when [a,b,c,d].select { |deg| deg <= 0}.size > 0
      raise QuadrilateralError

    when [a,b,c,d].sum != 360
      raise QuadrilateralError

    when  a == 90 && b == 90 && c == 90
      [:square, :rectangle]

    when (a == b && c == d) || (a == c && b == d) || (a == d && b == c)
      [:parallelogram, :rhombus]

    when a != b && b != c && c != d && d != a
      [:quadrilateral]

    when (a == (b||c||d)) || (b == (c||d)) || (c == d)
      [:quadrilateral]
  end
end

# Error class used in invalid_quadrilateral_spec. No need to change this code.
class QuadrilateralError < StandardError
end
