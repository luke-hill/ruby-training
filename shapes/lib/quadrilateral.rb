# frozen_string_literal: true

def quadrilateral(a, b, c, d)
  if a==90 && b==90 && c==90 && d==90
  [:square, :rectangle]
  else
    [:parallelogram, :rhombus]
  end
end


# Error class used in invalid_quadrilateral_spec. No need to change this code.
class QuadrilateralError < StandardError
end
