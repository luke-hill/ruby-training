# frozen_string_literal: true

# O(N) - This is arguably N(logN), but it is definitely less complex
# than solution two.
class MissingNumber
  def detect(input_array)
    # Catch by checking whether every input is an integer
    raise ArgumentError unless input_array.all? { |e| e.is_a?(Integer) }

    n = input_array.length

    # Only count along the array, summing all values
    actual_sum = input_array.inject(0) { |sum, value| sum + value }
    # Maths to calculate theoretical sum - Triangular Numbers
    theoretical_sum = (n * (n + 1)) / 2

    # Mathematical operations
    # Here if the theoretical sum and the actual sum are the same
    # the missing number is 1 more than the length
    #
    # If the theoretical sum and the actual sum are different then
    # the difference we obtain includes the value which is 1 larger
    # than the array. So for example [1, 3, 4, 2, 6] should not
    # contain 6 but 5.
    #
    # This means that the theoretical sum would be 15 but the actual
    # sum would be 16, so we have 1 too many.
    #
    # But as we need to know what value we were missing, we need to
    # extend the array by 1, and then add the 5 in. But in doing so
    # we are just adding on the original max value (i.e. the value
    # of input_array.length + 1)
    #
    # Both of these solutions therefore are as below, with the happy
    # path solution just featuring a (0 - 0) at the start
    theoretical_sum - actual_sum + input_array.length + 1
  end
end
