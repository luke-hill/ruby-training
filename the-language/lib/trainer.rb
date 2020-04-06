module Trainer
  class FillMeIn
    def initialize(caller_line)
      if (match = caller_line.match(/^(?<file>.+?):(?<line>\d+)/))
        @file = match["file"]
        @line = match["line"]
      else
        raise ArgumentError, "#{caller_line} does not match caller spec"
      end
    end

    def location
      [@file, @line].join(":")
    end

    def inspect
      "fill me in - please replace `__` on #{location}"
    end
  end

  def __
    FillMeIn.new(caller[0])
  end
end
