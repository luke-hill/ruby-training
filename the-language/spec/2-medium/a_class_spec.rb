RSpec.describe 'a ruby class' do
  class Dog
  end

  it 'creates new instances of Dog with new' do
    fido = Dog.new
    expect(fido.class).to eq(Dog)
  end

  class Dog2
    def set_name(a_name)
      @name = a_name
    end
  end

  it 'sets instance variables by assigning to them ' do
    fido = Dog2.new
    expect(fido.instance_variables).to eq([])

    fido.set_name('Fido')
    expect(fido.instance_variables).to eq([:@name])
  end

  it 'can not access instance variables outside of the class' do
    fido = Dog2.new
    fido.set_name('Fido')

    expect { fido.name }.to raise_error(NoMethodError)
    expect do
      eval 'fido.@name'
      # NOTE: Using eval because the above line is a syntax error.
    end.to raise_error(SyntaxError)
  end

  it 'is possible to ask for an instance variable, politely' do
    fido = Dog2.new
    fido.set_name('Fido')

    expect(fido.instance_variable_get('@name')).to eq('Fido')
  end

  it 'can rip out the instance variable using instance_eval' do
    fido = Dog2.new
    fido.set_name('Fido')

    expect(fido.instance_eval('@name')).to eq('Fido') # string version
    expect(fido.instance_eval { @name }).to eq('Fido') # block version
  end

  class Dog3
    def set_name(a_name)
      @name = a_name
    end

    def name
      @name
    end
  end

  it 'can have accessor methods to access instance variables' do
    fido = Dog3.new
    fido.set_name('Fido')

    expect(fido.name).to eq('Fido')
  end

  class Dog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end

  it 'can automatically define an accessor using attr_reader' do
    fido = Dog4.new
    fido.set_name('Fido')

    expect(fido.name).to eq('Fido')
  end

  class Dog5
    attr_accessor :name
  end

  it 'can automatically create readers and writers with attr_accessor' do
    fido = Dog5.new

    fido.name = 'Fido'
    expect(fido.name).to eq('Fido')
  end

  class Dog6
    attr_reader :name
    def initialize(initial_name)
      @name = initial_name
    end
  end

  it 'uses initialize to set up initial values of instance variables' do
    fido = Dog6.new('Fido')
    expect(fido.name).to eq('Fido')
  end

  it 'match args to new with initializer' do
    expect { Dog6.new }.to raise_error(ArgumentError)
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

  it 'uses self inside method to refer to the containing object' do
    fido = Dog7.new('Fido')

    fidos_self = fido.get_self
    expect(fidos_self).to eq(__)
  end

  it 'provides a string version of the object with to_s' do
    fido = Dog7.new('Fido')
    expect(fido.to_s).to eq(__)
  end

  it 'uses to_s inside string interpolation' do
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
  end
end
