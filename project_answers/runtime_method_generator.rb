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
    self.class.define_method(method_name) do |*runtime_args, &block|
      puts "Called new method: #{method_name}"
      puts "Args passed in: #{runtime_args.join(',')}" unless runtime_args.empty?
      puts "Runtime block defined: #{block.call}" if block
    end
  end
end

# A few examples of how this could be called and the outputs are below

# c = RuntimeMethodGenerator.new
# c.add_custom_method(:foo)
#
# c.foo
# => Called new method: foo
#
# c.foo(:arg1_value) { :hi }
# => Called new method: foo
# => Args passed in: arg1_value
# => Runtime block defined: hi
#
# c.foo(:arg1, 2, 'three') { p 'do the thing' }
# => Called new method: foo
# => Args passed in: arg1,2,three
# =>"do the thing"
# => Runtime block defined: do the thing
