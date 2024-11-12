RSpec.describe 'Class methods' do
  class Cat
  end

  it 'all instances of a class are objects' do
    percy = Cat.new
    expect(percy.is_a?(Object)).to eq(__)
  end

  it 'all classes (constructors), are classes' do
    expect(Cat.is_a?(Class)).to eq(__)
  end

  it 'classes are objects too' do
    expect(Cat.is_a?(Object)).to eq(__)
  end

  it 'instances have methods' do
    percy = Cat.new
    expect(percy.methods.size > __).to be true
  end

  it 'classes also have methods' do
    expect(Cat.methods.size > __).to be true
  end

  it 'is possible to define a method on an individual object' do
    # NB: Do not do this, a single instance should not be unique in terms of behaviour!
    percy = Cat.new
    def percy.wag
      :percys_wag
    end
    expect(percy.wag).to eq(__)
  end

  it 'does not affect other objects (instances), when defining singleton methods' do
    percy = Cat.new
    not_percy = Cat.new
    def percy.wag
      :percys_wag
    end

    expect { not_percy.wag }.to raise_error(__)
  end

  class TabbyCat
    def wag
      :instance_level_wag
    end
  end

  def TabbyCat.wag
    :class_level_wag
  end

  it 'is possible to define singleton methods on classes (remember they are objects)' do
    expect(TabbyCat.wag).to eq(__)
  end

  it 'is possible to have both a class and instance method identically named (they are independent)' do
    percy = TabbyCat.new
    expect(percy.wag).to eq(__)
    expect(TabbyCat.wag).to eq(__)
  end

  class TawnyCat
    attr_accessor :name
  end

  def TawnyCat.name
    @name
  end

  it 'does not share instance variables between classes and instances' do
    percy = TawnyCat.new
    percy.name = 'Percy'
    expect(percy.name).to eq(__)
    expect(TawnyCat.name).to eq(__)
  end

  LAST_EXPRESSION_IN_CLASS_STATEMENT = class GingerCat
                                         21
                                       end

  it 'returns the last expression inside a class statement (when defining a class)' do
    expect(LAST_EXPRESSION_IN_CLASS_STATEMENT).to eq(__)
  end

  SELF_INSIDE_OF_CLASS_STATEMENT = class GingerCat
                                     self
                                   end

  it 'uses self to refer to the class (not an instance of it), when inside the definition' do
    expect(GingerCat == SELF_INSIDE_OF_CLASS_STATEMENT).to eq(__)
  end

  class BrownCat
    def self.class_method
      :another_way_to_write_class_methods
    end
  end

  it 'is possible to use self to define a class method' do
    expect(BrownCat.class_method).to eq(__)
  end

  class BlackCat
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it 'has a third way to define a class method' do
    expect(BlackCat.another_class_method).to eq(__)
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
    percy = BlackCat.new

    def percy.instance_method
      self.class.another_class_method
    end

    expect(percy.instance_method).to eq(__)
  end

  # NOTE: Reopening BlackCat class

  class BlackCat
    def call_class_method_from_instance_method
      self.class.another_class_method
    end
  end

  it 'has a better way to call class methods from instance methods' do
    percy = BlackCat.new

    expect(percy.call_class_method_from_instance_method).to eq(__)
  end
end
