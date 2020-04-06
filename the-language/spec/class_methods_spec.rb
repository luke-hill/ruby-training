RSpec.describe "Class methods" do
  class Dog
  end

  it "all objects are Objects" do
    fido = Dog.new
    expect( fido.is_a?(Object) ).to eq( __ )
  end

  it "all classes are Classes" do
    expect( Dog.is_a?(Class) ).to eq( __ )
  end

  it "classes are objects too" do
    expect( Dog.is_a?(Object) ).to eq( __ )
  end

  it "has methods on objects" do
    fido = Dog.new
    expect( fido.methods.size > __ ).to eq( true )
  end

  it "has methods on classes" do
    expect( Dog.methods.size > __ ).to eq( true )
  end

  it "is possible to define a method on an individual object" do
    fido = Dog.new
    def fido.wag
      :fidos_wag
    end
    expect( fido.wag ).to eq( __ )
  end

  it "does not affect other objects with singleton methods" do
    fido = Dog.new
    rover = Dog.new
    def fido.wag
      :fidos_wag
    end

    expect {
      rover.wag
    }.to raise_error( __ )
  end

  class Dog2
    def wag
      :instance_level_wag
    end
  end

  def Dog2.wag
    :class_level_wag
  end

  it "is possible to define singleton methods on classes too, because they are objects" do
    expect( Dog2.wag ).to eq( __ )
  end

  it "keeps class and instance methods indepedent" do
    fido = Dog2.new
    expect( fido.wag ).to eq( __ )
    expect( Dog2.wag ).to eq( __ )
  end

  class Dog
    attr_accessor :name
  end

  def Dog.name
    @name
  end

  it "does not share instance variables between classes and instances" do
    fido = Dog.new
    fido.name = "Fido"
    expect( fido.name ).to eq( __ )
    expect( Dog.name ).to eq( __ )
  end

  class Dog
    def Dog.a_class_method
      :dogs_class_method
    end
  end

  it "is possible to define a class method inside the class" do
    expect( Dog.a_class_method ).to eq( __ )
  end

  LastExpressionInClassStatement = class Dog
                                     21
                                   end

  it "returns the last expression inside a class statement" do
    expect( LastExpressionInClassStatement ).to eq( __ )
  end

  SelfInsideOfClassStatement = class Dog
                                 self
                               end

  it "uses self to refer to the class, not an instance inside the class statement" do
    expect( Dog == SelfInsideOfClassStatement ).to eq( __ )
  end

  class Dog
    def self.class_method2
      :another_way_to_write_class_methods
    end
  end

  it "is possible to use self to define a class method" do
    expect( Dog.class_method2 ).to eq( __ )
  end

  class Dog
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

  it "has a third way to define a class method" do
    expect( Dog.another_class_method ).to eq( __ )
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

  it "has an easy way to call class methods from instance methods" do
    fido = Dog.new

    def fido.instance_method
      self.class.another_class_method
    end

    expect( fido.instance_method ).to eq( __ )
  end

end
