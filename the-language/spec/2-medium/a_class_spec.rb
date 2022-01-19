RSpec.describe 'a ruby class' do
  class Dog
  end

  it 'creates new instances of a class using the new method' do
    fido = Dog.new
    expect(fido.class).to eq(__)
  end

  class Dog2
    def set_name(a_name)
      @name = a_name
    end
  end

  it 'can set instance variables' do
    fido = Dog2.new
    expect(fido.instance_variables).to eq(__)

    fido.set_name('Fido')
    expect(fido.instance_variables).to eq(__)
  end

  it 'can not access instance variables by default' do
    fido = Dog2.new
    fido.set_name('Fido')

    expect { fido.name }.to raise_error(__)
    expect do
      eval 'fido.@name'
      # NOTE: Using eval because the above line is a syntax error.
    end.to raise_error(__)
  end

  it 'can obtain the value of an instance variable using instance_variable_get' do
    fido = Dog2.new
    fido.set_name('Fido')

    expect(fido.instance_variable_get('@name')).to eq(__)
  end

  it 'can also obtain the value of an instance variable using instance_eval' do
    fido = Dog2.new
    fido.set_name('Fido')

    expect(fido.instance_eval('@name')).to eq(__) # string version
    expect(fido.instance_eval { @name }).to eq(__) # block version
  end

  class Dog3
    def set_name(a_name)
      @name = a_name
    end

    def name
      @name
    end
  end

  it 'can create a basic method (reader), to access an instance variable' do
    fido = Dog3.new
    fido.set_name('Fido')

    expect(fido.name).to eq(__)
  end

  class Dog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end

  it 'can automatically define a reader method using attr_reader' do
    fido = Dog4.new
    fido.set_name('Fido')

    expect(fido.name).to eq(__)
  end

  class Dog5
    attr_accessor :name
  end

  it 'can automatically create readers and writers with attr_accessor' do
    fido = Dog5.new

    fido.name = 'Fido'
    expect(fido.name).to eq(__)
  end

  class Dog6
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end
  end

  it 'uses initialize to set up initial values of instance variables' do
    fido = Dog6.new('Fido')
    expect(fido.name).to eq(__)
  end

  it 'must match args to new with initializer' do
    expect { Dog6.new }.to raise_error(__)
    # THINK ABOUT IT: Why is this so?
  end

  it 'has different instance variables for different instances' do
    fido = Dog6.new('Fido')
    rover = Dog6.new('Rover')

    expect(rover.name != fido.name).to eq(__)
  end

  class Dog7
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

  it 'uses self to refer to the current object (whatever it is)' do
    fido = Dog7.new('Fido')

    fidos_self = fido.get_self
    expect(fidos_self).to eq(__)
  end

  it 'provides a string version of the object with to_s' do
    fido = Dog7.new('Fido')
    expect(fido.to_s).to eq(__)
  end

  it 'automatically uses to_s inside string interpolation' do
    fido = Dog7.new('Fido')
    expect("My dog is #{fido}").to eq(__)
  end

  it 'uses inspect to provide a string description of the object' do
    fido = Dog7.new('Fido')
    expect(fido.inspect).to eq(__)
  end

  it 'has to_s and inspect on all objects' do
    array = [1, 2, 3]

    expect(array.to_s).to eq(__)
    expect(array.inspect).to eq(__)

    expect('STRING'.to_s).to eq(__)
    expect('STRING'.inspect).to eq(__)

    expect(Dog.to_s).to eq(__)
    expect(Dog.inspect).to eq(__)
  end
end
