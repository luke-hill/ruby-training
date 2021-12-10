# frozen_string_literal: true

class NumberValidator
  attr_reader :group

  def initialize
    @group = []
  end

  def validate(number)
    group << :even if number.even?
    group << :odd if number.odd?
    group << :divisible_by_three if number % 3 == 0

    group
  end
end
