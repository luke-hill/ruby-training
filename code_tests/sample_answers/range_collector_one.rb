# frozen_string_literal: true

class RangeCollector
  attr_reader :new_array

  def initialize
    @new_array = []
  end

  def play(array)
    array.each_with_index do |value, index|
      puts "value: " + value.to_s
      puts "index: " + index.to_s

      last_number = new_array[-1]

      if last_number&.is_a?(String)
        # check for extending range
        last_integer = last_number[-1].to_i
        next_integer = last_integer + 1
        puts "Last int #{last_integer}"

        if next_integer == value
          puts "Extending range"
          start_range_value = new_array[-1][0]
          end_range_value = next_integer
          range_value = "#{start_range_value}-#{end_range_value}"
          puts "Range value: #{range_value}"
          new_array.pop
          new_array << range_value
        else
          puts "No conflicting logic, adding number '#{value}' to array"
          new_array << value
        end
      elsif last_number&.is_a?(Integer)
        # check for creating range
        if last_number + 1 == value
          puts "Creating new range"
          start_range_value = last_number
          end_range_value = value
          range_value = "#{start_range_value}-#{end_range_value}"
          puts "Range value: #{range_value}"
          new_array.pop
          new_array << range_value
        else
          puts "No conflicting logic, adding number '#{value}' to array"
          new_array << value
        end
      else
        puts "No conflicting logic, adding number '#{value}' to array"
        new_array << value
      end
    end

    new_array
  end
end
