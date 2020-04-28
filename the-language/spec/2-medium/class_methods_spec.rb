# frozen_string_literal: true

RSpec.describe 'Class methods' do
  class Cat
  end

  it 'all objects are Objects' do
    fido = Dog.new
    expect(fido.is_a?(Object)).to eq(__)
  end

  it 'all classes are Classes' do
    expect(Dog.is_a?(Class)).to eq(__)
  end

  it 'classes are objects too' do
    expect(Dog.is_a?(Object)).to eq(__)
  end

  it 'has methods on objects' do
    fido = Dog.new
    expect(fido.methods.size > __).to eq(true)
  end

  it 'has methods on classes' do
    expect(Dog.methods.size > __).to eq(true)
  end

  it 'is possible to define a method on an individual object' do
    percy = Cat.new
    def percy.wag
      :percys_wag
    end
    expect(fido.wag).to eq(__)
  end

  it 'does not affect other objects with singleton methods' do
    percy = Cat.new
    not_percy = Cat.new
    def percy.wag
      :percys_wag
    end

    expect do
      rover.wag
    end.to raise_error(__)
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
    expect(Dog2.wag).to eq(__)
  end

  it 'keeps class and instance methods indepedent' do
    fido = Dog2.new
    expect(fido.wag).to eq(__)
    expect(Dog2.wag).to eq(__)
  end

  class Cat3
    attr_accessor :name
  end

  def Cat3.name
    @name
  end

  it 'does not share instance variables between classes and instances' do
    fido = Dog.new
    fido.name = 'Fido'
    expect(fido.name).to eq(__)
    expect(Dog.name).to eq(__)
  end

  class Cat4
    def self.a_class_method
      :dogs_class_method
    end
  end

  it 'is possible to define a class method inside the class' do
    expect(Dog.a_class_method).to eq(__)
  end

  LAST_EXPRESSION_IN_CLASS_STATEMENT = class Cat5
                                         21
                                       end

  it 'returns the last expression inside a class statement' do
    expect(LAST_EXPRESSION_IN_CLASS_STATEMENT).to eq(__)
  end

  SELF_INSIDE_OF_CLASS_STATEMENT = class Cat5
                                     self
                                   end

  it 'uses self to refer to the class, not an instance inside the definition' do
    expect(Dog == SELF_INSIDE_OF_CLASS_STATEMENT).to eq(__)
  end

  class Cat6
    def self.class_method
      :another_way_to_write_class_methods
    end
  end

  it 'is possible to use self to define a class method' do
    expect(Dog.class_method2).to eq(__)
  end

  class Cat7
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it 'has a third way to define a class method' do
    expect(Dog.another_class_method).to eq(__)
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

    expect(fido.instance_method).to eq(__)
  end
end
