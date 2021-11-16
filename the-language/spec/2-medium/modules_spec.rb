RSpec.describe 'modules' do
  module Nameable
    def set_name(new_name)
      @name = new_name
    end

    def here
      :in_module
    end
  end

  it 'is not possible to instantiate a module' do
    expect do
      Nameable.new
    end.to raise_error(NoMethodError, /undefined method/)
  end

  class Dog8
    include Nameable

    attr_reader :name

    def initialize
      @name = 'Fido'
    end

    def bark
      'WOOF'
    end

    def here
      :in_object
    end
  end

  it 'has access to normal instance methods' do
    fido = Dog8.new
    expect(fido.bark).to eq('WOOF')
  end

  it 'also has access to methods defined by the included module' do
    fido = Dog8.new
    expect(fido.methods.include?(:set_name)).to eq(true)
    expect(fido.methods.include?(:here)).to eq(true)
  end

  it 'can change instance variables from a method defined in a module' do
    fido = Dog8.new
    expect(fido.name).to eq('Fido')
    fido.set_name('Rover')
    expect(fido.name).to eq('Rover')
  end

  it 'a method defined in a class overrides an included method from a module' do
    fido = Dog8.new
    expect(fido.here).to eq(:in_object)
  end
end
