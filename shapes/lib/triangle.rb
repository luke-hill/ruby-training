# frozen_string_literal: true

def triangle(a, b, c)
  sides = [a, b, c]

  raise TriangleError, 'Side length must be positive' if sides.any? { |side| side <= 0 }

  longest = sides.max
  sum_of_others = sides.sum - longest
  raise TriangleError, 'Not a valid triangle' if longest >= sum_of_others

  unique_sides = sides.uniq.count

  case unique_sides
  when 1
    :equilateral
  when 2
    :isosceles
  when 3
    :scalene
  end
end

# Error class used in triangle_spec. No need to change this code.
class TriangleError < StandardError
end
