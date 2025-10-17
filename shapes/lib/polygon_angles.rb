# frozen_string_literal: true

def internal_angle(number_of_sides)
  angle = ((number_of_sides - 2) * 180.0) / number_of_sides
  angle.round(2)
end

def external_angle(number_of_sides)
  angle = 360.0 / number_of_sides
  angle.round(2)
end
