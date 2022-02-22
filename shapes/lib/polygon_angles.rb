# frozen_string_literal: true

def internal_angle(number_of_sides)
  case number_of_sides
  when 5
    108
  when 6
    120
  when 7
    128.57
  when 8
    135
  when 9
    140
  when 10
    144
  end
end

def external_angle(number_of_sides)
  case number_of_sides
  when 5
    72
  when 6
    60
  when 7
    51.43
  when 8
    45
  when 9
    40
  when 10
    36
  end
end
