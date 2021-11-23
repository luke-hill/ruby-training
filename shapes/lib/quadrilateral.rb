# frozen_string_literal: true

def quadrilateral(a, b, c, d)
  elements = [a, b, c, d]
  sum = (a+b+c+d)
  if (elements.include? 0) || (elements.sum != 360) 
    raise QuadrilateralError
  elsif (a < 0) || (b < 0) || (c < 0 ) || (d < 0)
    raise QuadrilateralError
  elsif (a == b) && (b == c) && (c == d)
    [:square, :rectangle]
  elsif ((a == b) && (c == d)) || ((a == c) && (b == d)) || ((a == d) && (b == c))
    [:parallelogram, :rhombus]
  else
    [:quadrilateral]
  end
end
  

# Error class used in invalid_quadrilateral_spec. No need to change this code.
class QuadrilateralError < StandardError
end
