# frozen_string_literal: true

class NumberValidator
  attr_reader :group

  def initialize
    @group = []
  end

  def validate(number)
    if number.even?
      group << :even
    else
      group << :odd
    end
  end
end
