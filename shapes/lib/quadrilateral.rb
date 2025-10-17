# frozen_string_literal: true

def quadrilateral(a, b, c, d)
  angles = [a, b, c, d]

  raise QuadrilateralError, 'Invalid angles' if angles.any? { |angle| angle <= 0 }
  raise QuadrilateralError, 'Angles do not sum to 360' if angles.sum != 360

  unique_counts = angles.uniq.map { |angle| angles.count(angle) }.sort.reverse

  if unique_counts == [4]
    [:square, :rectangle]
  elsif unique_counts == [2, 2]
    [:parallelogram, :rhombus]
  else
    [:quadrilateral]
  end
end

# Error class used in quadrilateral_spec. No need to change this code.
class QuadrilateralError < StandardError
end
