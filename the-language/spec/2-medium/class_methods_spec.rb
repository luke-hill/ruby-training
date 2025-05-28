# frozen_string_literal: true

RSpec.describe 'Class methods' do
  let(:cat) { Class.new }

  it 'all instances of a class are objects' do
    percy = cat.new
    expect(percy.is_a?(Object)).to eq(__)
  end

  it 'all classes (constructors), are classes' do
    expect(cat.is_a?(Class)).to eq(__)
  end

  it 'classes are objects too' do
    expect(cat.is_a?(Object)).to eq(__)
  end

  it 'instances have methods' do
    percy = cat.new
    expect(percy.methods.size > __).to be true
  end

  it 'classes also have methods' do
    expect(cat.methods.size > __).to be true
  end

  it 'is possible to define a method on an individual object' do
    # NB: Do not do this, a single instance should not be unique in terms of behaviour!
    percy = cat.new
    def percy.wag
      :percys_wag
    end
    expect(percy.wag).to eq(__)
  end

  it 'does not affect other objects (instances), when defining singleton methods' do
    percy = cat.new
    not_percy = cat.new
    def percy.wag
      :percys_wag
    end

    expect { not_percy.wag }.to raise_error(__)
  end
  
  let(:tabby_cat) do
    Class.new do
      def self.wag
        :class_level_wag
      end
      
      def wag
        :instance_level_wag
      end
    end
  end

  it 'is possible to have both a class and instance method identically named (they are independent)' do
    percy = tabby_cat.new
    expect(percy.wag).to eq(__)
    expect(tabby_cat.wag).to eq(__)
  end

  class Tawnycat
    attr_accessor :name
  end

  def Tawnycat.name
    @name
  end

  it 'does not share instance variables between classes and instances' do
    percy = Tawnycat.new
    percy.name = 'Percy'
    expect(percy.name).to eq(__)
    expect(Tawnycat.name).to eq(__)
  end

  LAST_EXPRESSION_IN_CLASS_STATEMENT = class Gingercat
                                         21
                                       end

  it 'returns the last expression inside a class statement (when defining a class)' do
    expect(LAST_EXPRESSION_IN_CLASS_STATEMENT).to eq(__)
  end

  SELF_INSIDE_OF_CLASS_STATEMENT = class Gingercat
                                     self
                                   end

  it 'uses self to refer to the class (not an instance of it), when inside the definition' do
    expect(Gingercat == SELF_INSIDE_OF_CLASS_STATEMENT).to eq(__)
  end
  
  let(:brown_cat) do
    Class.new do
      def self.class_method
        :another_way_to_write_class_methods
      end
    end
  end

  let(:black_cat) do
    Class.new do
      class << self
        def another_class_method
          :still_another_way
        end
      end

      def call_class_method_from_instance_method
        self.class.another_class_method
      end
    end
  end

  it 'is possible to use self to define a class method' do
    expect(brown_cat.class_method).to eq(__)
  end

  it 'has a third way to define a class method' do
    expect(black_cat.another_class_method).to eq(__)
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
    percy = black_cat.new

    def percy.instance_method
      self.class.another_class_method
    end

    expect(percy.instance_method).to eq(__)
  end

  it 'has a better way to call class methods from instance methods' do
    percy = black_cat.new

    expect(percy.call_class_method_from_instance_method).to eq(__)
  end
end
