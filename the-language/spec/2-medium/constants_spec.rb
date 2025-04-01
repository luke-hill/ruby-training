C = 'top level'

# Constants at existing class vs top level class
class More
  C = 'nested'

  def self.local
    C
  end

  def self.global
    ::C
  end

  def local
    C
  end
end

# Constants in a class vs nested class
class Animal
  LEGS = 4

  class NestedAnimal
    def legs_in_nested_animal
      LEGS
    end
  end

  class Millipede
    LEGS = 1000

    def legs_in_millipede
      LEGS
    end
  end
end

# Constants in a child class
class Reptile < Animal
  def legs_in_reptile
    LEGS
  end
end

# Constants in a nested class that also inherits
class Zoo
  LEGS = 2

  class Bird < Animal
    def legs_in_bird
      LEGS
    end
  end
end

# Constants in a inheriting class that previously inherited a definition
class Zoo
  class Oyster < Animal
    def legs_in_oyster
      LEGS
    end
  end
end

describe 'Constants' do
  # Constants in ruby act quite differently to other languages. Predominantly they are different
  # because they can be instantiated at any point in the life of the program, as such they are not
  # really "constant" because they can be modified / altered

  it 'references local constants' do
    expect(More.local).to eq(__)
  end

  it 'uses the double colon `::`, syntax to reference global constants' do
    expect(More.global).to eq(__)
  end

  it 'references nested constants using their complete path' do
    expect(More::C).to eq(__)
    expect(::More::C).to eq(__)
  end

  it 'can access constants on instances as well as the class' do
    instance = More.new
    expect(instance.local).to eq(__)
  end

  it 'inherits constants from enclosing classes' do
    expect(Animal::NestedAnimal.new.legs_in_nested_animal).to eq(__)
  end

  it 'ignores inherited constants if a more local definition exists' do
    expect(Animal::Millipede.new.legs_in_millipede).to eq(__)
  end

  it 'inherits constants when subclassed from the parent class' do
    expect(Reptile.new.legs_in_reptile).to eq(__)
  end

  context 'with an inherited class AND an enclosing class' do
    it 'can add a new overridden constant (from the enclosing class), in a subclass' do
      expect(Zoo::Bird.new.legs_in_bird).to eq(__)
    end

    # Remember that we have already defined what Zoo::LEGS was earlier
    it 'always uses the top level enclosing class FIRST if it was previously defined' do
      # i.e. the top level enclosing class is the "most important" determinant for inheritance of constants
      expect(Zoo::Oyster.new.legs_in_oyster).to eq(__)
    end
  end
end
