# frozen_string_literal: true

# O(N**2)
class MissingNumber
  def detect(input_array)
    # Catch by checking whether every input is an integer
    raise ArgumentError unless input_array.all? { |e| e.is_a?(Integer) }

    # If empty input - return 1 (Test Case 1)
    return 1 if input_array.empty?

    # Backwards logic here
    # If we have a situation with a missing number, then we iterate through the
    # sorted array. At each stage the index (1 - indexed), and integer should equal
    # each other. As soon as then don't return (not break), out and end the loop
    # This returned value will be the missing number
    input_array.sort.each.with_index(1) do |item, index|
      return index unless item == index
    end

    # If we have failed the logic above, i.e. we have a complete array, then simply
    # return the value that is 1 larger than the original input length
    # so an input array of [1, 3, 2] is of length 3, so return 4.
    input_array.length + 1
  end
end
