RSpec.describe 'Modules' do
  module Nameable
    def set_name(new_name)
      @name = new_name
    end

    def here
      :in_module
    end
  end

  it 'is not possible to instantiate a module' do
    expect { Nameable.new }.to raise_error(NoMethodError)
  end

  class Parrot
    include Nameable

    attr_reader :name

    def initialize
      @name = 'Polly'
    end

    def squawk
      'Squawk!'
    end

    def here
      :in_object
    end
  end

  it 'has access to normal instance methods' do
    polly = Parrot.new
    expect(polly.squawk).to eq("Squawk!")
  end

  it 'also has access to methods defined by the included module' do
    polly = Parrot.new
    expect(polly.methods.include?(:set_name)).to eq(true)
    expect(polly.methods.include?(:here)).to eq(true)
  end

  it 'can change instance variables from a method defined in a module' do
    polly = Parrot.new
    expect(polly.name).to eq('Polly')
    polly.set_name('Lola')
    expect(polly.name).to eq('Lola')
  end

  it 'a method defined in a class overrides an included method from a module' do
    polly = Parrot.new
    expect(polly.here).to eq(:in_object)
  end

  # There is also the concept of `extend`ing a module which we don't deal with here.
  #
  # This works in exactly the same way, but it exposes all Module methods as 'class' methods NOT 'instance' methods.
  # The research / implementation of this is left as an exercise for you
end
