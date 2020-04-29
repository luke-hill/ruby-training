# frozen_string_literal: true

RSpec.describe 'Class methods' do
  class Cat
  end

  it 'all objects are Objects' do
    percy = Cat.new
    expect(percy.is_a?(Object)).to eq(true)
  end

  it 'all classes are Classes' do
    expect(Cat.is_a?(Class)).to eq(true)
  end

  it 'classes are objects too' do
    expect(Cat.is_a?(Object)).to eq(true)
  end

  it 'has methods on objects' do
    percy = Cat.new
    expect(percy.methods.size > 0).to eq(true)
  end

  it 'has methods on classes' do
    expect(Cat.methods.size > 0).to eq(true)
  end

  it 'is possible to define a method on an individual object' do
    percy = Cat.new
    def percy.wag
      :percys_wag
    end
    expect(percy.wag).to eq(:percys_wag)
  end

  it 'does not affect other objects with singleton methods' do
    percy = Cat.new
    not_percy = Cat.new
    def percy.wag
      :percys_wag
    end

    expect do
      not_percy.wag
    end.to raise_error(NoMethodError)
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
    expect(Cat2.wag).to eq(:class_level_wag)
  end

  it 'keeps class and instance methods indepedent' do
    percy = Cat2.new
    expect(percy.wag).to eq(:instance_level_wag)
    expect(Cat2.wag).to eq(:class_level_wag)
  end

  class Cat3
    attr_accessor :name
  end

  def Cat3.name
    @name
  end

  it 'does not share instance variables between classes and instances' do
    percy = Cat3.new
    percy.name = 'percy'
    expect(percy.name).to eq('percy')
    expect(Cat3.name).to eq(nil)
  end

  class Cat4
    def self.a_class_method
      :Cats_class_method
    end
  end

  it 'is possible to define a class method inside the class' do
    expect(Cat4.a_class_method).to eq(:Cats_class_method)
  end

  LAST_EXPRESSION_IN_CLASS_STATEMENT = class Cat5
                                         21
                                       end

  it 'returns the last expression inside a class statement' do
    expect(LAST_EXPRESSION_IN_CLASS_STATEMENT).to eq(21)
  end

  SELF_INSIDE_OF_CLASS_STATEMENT = class Cat5
                                     self
                                   end

  it 'uses self to refer to the class, not an instance inside the definition' do
    expect(Cat5 == SELF_INSIDE_OF_CLASS_STATEMENT).to eq(true)
  end

  class Cat6
    def self.class_method
      :another_way_to_write_class_methods
    end
  end

  it 'is possible to use self to define a class method' do
    expect(Cat6.class_method).to eq( :another_way_to_write_class_methods)
  end

  class Cat7
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it 'has a third way to define a class method' do
    expect(Cat7.another_class_method).to eq( :still_another_way)
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

  # ------------------------------------------------------------------

  it 'has an easy way to call class methods from instance methods' do
    percy = Cat7.new

    def percy.instance_method
      self.class.another_class_method
    end

    expect(percy.instance_method).to eq(:still_another_way)
  end
end
