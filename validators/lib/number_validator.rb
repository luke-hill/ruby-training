# frozen_string_literal: true

class NumberValidator
  attr_reader :group

  def initialize
    @group = []
  end

  def validate(number)
    group.tap do |grp|
      grp << :even if number.even?
      grp << :odd if number.odd?
      grp << :divisible_by_three if number % 3 == 0
      grp << :divisible_by_five if number % 5 == 0
      grp << :divisible_by_seven if number % 7 == 0
      grp << :divisible_by_nine if number % 9 == 0
    end
  end
end
