RSpec.describe "modules" do
  module Nameable
    def set_name(new_name)
      @name = new_name
    end

    def here
      :in_module
    end
  end

  it "is not possible to instantiate a module" do
    expect {
      Nameable.new
    }.to raise_error(__)
  end

  class Dog
    include Nameable

    attr_reader :name

    def initialize
      @name = "Fido"
    end

    def bark
      "WOOF"
    end

    def here
      :in_object
    end
  end

  it "has access to normal instance methods" do
    fido = Dog.new
    expect( fido.bark ).to eq( __ )
  end

  it "also has access to methods defined by the included module" do
    fido = Dog.new

    fail "remove this line when you've read and understood the code below"
    expect {
      fido.set_name("Rover")
    }.not_to raise_error
  end

  it "can change instance variables from a method defined in a module" do
    fido = Dog.new
    expect( fido.name ).to eq( __ )
    fido.set_name("Rover")
    expect( fido.name ).to eq( __ )
  end

  it "a method defined in a class will override an included method from a module" do
    fido = Dog.new
    expect( fido.here ).to eq( __ )
  end
end

