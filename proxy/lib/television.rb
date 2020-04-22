# frozen_string_literal: true

# The following code is to support the testing of the Proxy class.
# No changes should be necessary to anything in this file

# Example Television class being used in the proxy testing
class Television
  attr_accessor :channel, :power
  attr_writer :power

  def power
    return self.power = :off if on?

    self.power = :on
  end

  def on?
    @power == :on
  end
end
