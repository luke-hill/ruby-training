# frozen_string_literal: true

class Dice
    attr_reader :values
    def roll(number = 1)
    @values = []
     number.times { @values.push rand(6)+1 }
    end
end



