# frozen_string_literal: true

# O(N)
class MissingNumber
  def detect(input_array)
    # Catch by checking whether every input is an integer
    raise ArgumentError unless input_array.all? { |e| e.is_a?(Integer) }

    # Only count along the array, summing all values
    actual_sum = input_array.inject(0) { |sum, value| sum + value }
    # Count along a new theoretical array, summing all values
    theoretical_sum = (1..input_array.length + 1).inject(0) { |sum, value| sum + value }

    # Mathematical operations
    if (theoretical_sum - actual_sum).zero?
      input_array.length + 1
    else
      theoretical_sum - actual_sum
    end
  end
end
