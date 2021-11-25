# frozen_string_literal: true

class Dice
    def roll(count)
        [1,2,3,4,5,6].each {|e| e.rand(1..6)}
    end
end
