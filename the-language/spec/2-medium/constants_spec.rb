C = 'top level'

class More
  C = 'nested'

  def self.local
    C
  end

  def self.double_colon
    ::C
  end
end

describe 'Constants in ruby are different' do
  it 'references local constants' do
    expect(More.local).to eq(__)
  end

  it 'uses double colon to reference global constants' do
    expect(More.double_colon).to eq(__)
  end

  it 'references nested constants using their complete path' do
    expect(More::C).to eq(__)
    expect(::More::C).to eq(__)
  end

  it 'can access constants on instances as well as the class' do
    instance = More.new
    expect(instance::C).to eq(__)
  end

  class Animal
    LEGS = 4

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  it 'inherits constants from enclosing classes' do
    expect(Animal::NestedAnimal.new.legs_in_nested_animal).to eq(__)
  end

  class Reptile < Animal
    def legs_in_reptile
      LEGS
    end
  end

  it 'inherits constants when subclassed from the parent class' do
    expect(Reptile.new.legs_in_reptile).to eq(__)
  end

  class Zoo
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        LEGS
      end
    end
  end

  context 'with an inherited class and an enclosing class' do
    it 'can add a new overridden constant (from the enclosing class), in a subclass' do
      expect(Zoo::Bird.new.legs_in_bird).to eq(__)
    end

    class Zoo
      class Oyster < Animal
        def legs_in_oyster
          LEGS
        end
      end
    end

    # Remember that we have already defined what Zoo::LEGS was earlier
    it 'always uses the top level enclosing class if previously defined' do
      expect(Zoo::Oyster.new.legs_in_oyster).to eq(__)
    end
  end
end
