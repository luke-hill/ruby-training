RSpec.describe 'class methods' do
  class Cat
  end

  it 'all instances are Objects' do
    percy = Cat.new
    expect(percy.is_a?(Object)).to eq(__)
  end

  it 'all classes (constructors), are Classes' do
    expect(Cat.is_a?(Class)).to eq(__)
  end

  it 'classes are objects too' do
    expect(Cat.is_a?(Object)).to eq(__)
  end

  it 'instances have methods' do
    percy = Cat.new
    expect(percy.methods.size > __).to eq(true)
  end

  it 'classes have methods' do
    expect(Cat.methods.size > __).to eq(true)
  end

  it 'is possible to define a method on an individual object' do
    percy = Cat.new
    def percy.wag
      :percys_wag
    end
    expect(percy.wag).to eq(__)
  end

  it 'does not affect other objects with singleton methods' do
    percy = Cat.new
    not_percy = Cat.new
    def percy.wag
      :percys_wag
    end

    expect { not_percy.wag }.to raise_error(__)
  end

  class Cat2
    def wag
      :instance_level_wag
    end
  end

  def Cat2.wag
    :class_level_wag
  end

  it 'is possible to define singleton methods on classes; they are objects' do
    expect(Cat2.wag).to eq(__)
  end

  it 'is possible to have both a class and instance method identically named (independent)' do
    percy = Cat2.new
    expect(percy.wag).to eq(__)
    expect(Cat2.wag).to eq(__)
  end

  class Cat3
    attr_accessor :name
  end

  def Cat3.name
    @name
  end

  it 'does not share instance variables between classes and instances' do
    percy = Cat3.new
    percy.name = 'Percy'
    expect(percy.name).to eq(__)
    expect(Cat3.name).to eq(__)
  end

  LAST_EXPRESSION_IN_CLASS_STATEMENT = class Cat4
                                         21
                                       end

  it 'returns the last expression inside a class statement' do
    expect(LAST_EXPRESSION_IN_CLASS_STATEMENT).to eq(__)
  end

  SELF_INSIDE_OF_CLASS_STATEMENT = class Cat4
                                     self
                                   end

  it 'uses self to refer to the class, not an instance inside the definition' do
    expect(Cat4 == SELF_INSIDE_OF_CLASS_STATEMENT).to eq(__)
  end

  class Cat5
    def self.class_method
      :another_way_to_write_class_methods
    end
  end

  it 'is possible to use self to define a class method' do
    expect(Cat5.class_method).to eq(__)
  end

  class Cat6
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it 'has a third way to define a class method' do
    expect(Cat6.another_class_method).to eq(__)
  end

  # THINK ABOUT IT:
  #
  # The two major ways to write class methods are:
  #   class Demo
  #     def self.method
  #     end
  #
  #     class << self
  #       def class_methods
  #       end
  #     end
  #   end
  #
  # Which do you prefer and why?
  # Are there times you might prefer one over the other?

  it 'has an easy way to call class methods from instance methods' do
    percy = Cat6.new

    def percy.instance_method
      self.class.another_class_method
    end

    expect(percy.instance_method).to eq(__)
  end

  # NOTE: Reopening Cat6 class

  class Cat6
    def call_class_method_from_instance_method
      self.class.another_class_method
    end
  end

  it 'can define a better way to call class methods from instance methods' do
    percy = Cat6.new

    expect(percy.call_class_method_from_instance_method).to eq(__)
  end
end
