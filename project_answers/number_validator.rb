# frozen_string_literal: true

class NumberValidator
  attr_reader :group

  def initialize
    @group = []
  end

  def validate(number)
    raise ArgumentError unless number.is_a?(Integer)

    validate_divisibility
    validate_type
  end

  private

  def validate_divisibility
    validate_divisible_by_three
    validate_divisible_by_five
    validate_divisible_by_seven
    validate_divisible_by_nine
  end

  def validate_divisible_by_three
    group << :divisible_by_three if (number % 3).zero?
  end

  def validate_divisible_by_five
    group << :divisible_by_five if (number % 5).zero?
  end

  def validate_divisible_by_seven
    group << :divisible_by_seven if (number % 7).zero?
  end

  def validate_divisible_by_nine
    group << :divisible_by_nine if (number % 9).zero?
  end

  def validate_type
    if number.even?
      group << :even
    else
      group << :odd
    end
  end
end
