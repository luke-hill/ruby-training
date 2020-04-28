# frozen_string_literal: true

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

describe 'Ruby Constant' do
  it 'references local constants' do
    expect(More.local).to eq('nested')
  end

  it 'uses double colon to reference global constants' do
    expect(More.double_colon).to eq('top level')
  end

  it 'references nested constants using their complete path' do
    expect(More::C).to eq('nested')
    expect(::More::C).to eq('nested')
  end

  class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  it 'inherits constants from enclosing classes' do
    expect(Animal::NestedAnimal.new.legs_in_nested_animal).to eq(4)
  end

  class Reptile < Animal
    def legs_in_reptile
      LEGS
    end
  end

  it 'inherits constants in subclasses from the parent class' do
    expect(Reptile.new.legs_in_reptile).to eq(4)
  end

  class MyAnimals
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        LEGS
      end
    end
  end

  it 'can add a new constant in a subclass' do
    expect(MyAnimals::Bird.new.legs_in_bird).to eq(2)
  end

  class MyAnimals
    class Oyster < Animal
      def legs_in_oyster
        LEGS
      end
    end
  end

  it 'is different when the lexical scope changes' do
    expect(MyAnimals::Oyster.new.legs_in_oyster).to eq(2)
  end
end
