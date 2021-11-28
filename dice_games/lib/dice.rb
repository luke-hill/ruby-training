# frozen_string_literal: true

class Dice
    attr_reader :values
    def roll(number)
    @values = []
     number.times {@values.push rand(7) }
    end
end

