# frozen_string_literal: true

# This class has some methods that return some symbols
# It ALSO needs to have some methods that can then generate other methods
#
# Do NOT AMEND the predefined methods. They are designed to be obtrusive!
#
class RuntimeMethodGenerator
  def predefined
    :predefined
  end

  def return_funky
    :funky
  end

  def add_a_method
    self.class.define_method(:funky_method) { return_funky }
  end

  def add_custom_method(method_name)
    self.class.define_method(method_name) { puts "Called new method: #{method_name}" }
  end
end
