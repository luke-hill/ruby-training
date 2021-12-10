# frozen_string_literal: true

class NumberValidator
  attr_reader :group

  def initialize
    @group = []
  end

  def validate(number)
    raise ArgumentError unless number.is_a?(Integer)

    group.tap do |grp|
      grp << :even if number.even?
      grp << :odd if number.odd?
      grp << :divisible_by_three if (number % 3).zero?
      grp << :divisible_by_five if (number % 5).zero?
      grp << :divisible_by_seven if (number % 7).zero?
      grp << :divisible_by_nine if (number % 9).zero?
    end
  end
end
