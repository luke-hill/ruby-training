RSpec.describe 'Classes' do
  class Dog
  end

  it 'creates new instances of a class using the new method' do
    fido = Dog.new
    expect(fido.class).to eq(__)
  end

  class BrownDog
    def set_name(a_name)
      @name = a_name
    end
  end

  it 'can set instance variables' do
    fido = BrownDog.new
    expect(fido.instance_variables).to eq(__)

    fido.set_name('Fido')
    expect(fido.instance_variables).to eq(__)
  end

  it 'cannot access instance variables by default' do
    fido = BrownDog.new
    fido.set_name('Fido')

    expect { fido.name }.to raise_error(__)
    expect do
      eval 'fido.@name'
      # NOTE: Using eval because the above line is a syntax error.
    end.to raise_error(__)
  end

  it 'can obtain the value of an instance variable using #instance_variable_get' do
    fido = BrownDog.new
    fido.set_name('Fido')

    expect(fido.instance_variable_get('@name')).to eq(__)
  end

  it 'can also obtain the value of an instance variable using #instance_eval' do
    fido = BrownDog.new
    fido.set_name('Fido')

    expect(fido.instance_eval('@name')).to eq(__) # string version
    expect(fido.instance_eval { @name }).to eq(__) # block version
  end

  class WhiteDog
    def set_name(a_name)
      @name = a_name
    end

    def name
      @name
    end
  end

  it 'can create a basic method (reader), to access an instance variable' do
    fido = WhiteDog.new
    fido.set_name('Fido')

    expect(fido.name).to eq(__)
  end

  class BlackDog
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end

  it 'can automatically define a reader method using #attr_reader' do
    fido = BlackDog.new
    fido.set_name('Fido')

    expect(fido.name).to eq(__)
  end

  class SpottedDog
    attr_accessor :name
  end

  it 'can automatically create readers and writers with #attr_accessor' do
    fido = SpottedDog.new

    fido.name = 'Fido'
    expect(fido.name).to eq(__)
  end

  class FluffyDog
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end
  end

  it 'uses #initialize to set up initial values of instance variables' do
    fido = FluffyDog.new('Fido')
    expect(fido.name).to eq(__)
  end

  it 'must match the number of arguments when calling `new` with the #initialize method' do
    expect { FluffyDog.new }.to raise_error(__)
    # THINK ABOUT IT: Why is this so?
  end

  it 'has different instance variables for different instances' do
    fido = FluffyDog.new('Fido')
    rover = FluffyDog.new('Rover')

    expect(rover.name != fido.name).to eq(__)
  end

  class BabyDog
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end

    def get_self
      self
    end

    def to_s
      @name
    end

    def inspect
      "<Dog named '#{name}'>"
    end
  end

  # This is a complicated one
  it 'uses self to refer to the current object (whatever it is)' do
    fido = BabyDog.new('Fido')

    fidos_self = fido.get_self
    expect(fidos_self).to eq(__)
  end

  it 'provides a string version of the object with to_s' do
    fido = BabyDog.new('Fido')
    expect(fido.to_s).to eq(__)
  end

  it 'automatically uses #to_s when inside a string being interpolated' do
    fido = BabyDog.new('Fido')
    expect("My dog is #{fido}").to eq(__)
  end

  it 'uses #inspect to provide a string description of the object' do
    fido = BabyDog.new('Fido')
    expect(fido.inspect).to eq(__)
  end

  it 'has #to_s and #inspect on all objects' do
    array = [1, 2, 3]

    expect(array.to_s).to eq(__)
    expect(array.inspect).to eq(__)

    expect('STRING'.to_s).to eq(__)
    expect('STRING'.inspect).to eq(__)

    expect(BabyDog.to_s).to eq(__)
    expect(BabyDog.inspect).to eq(__)
  end
end
