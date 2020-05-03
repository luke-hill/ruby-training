# frozen_string_literal: true

class MissingNumber
  def detect(input_array)
    raise ArgumentError unless input_array.all? { |e| e.is_a?(Integer) }

    return 1 if input_array.empty?

    input_array.sort.each.with_index(1) do |item, index|
      return index unless item == index
    end

    input_array.length + 1
  end
end
