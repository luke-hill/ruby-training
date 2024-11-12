RSpec.describe 'Inheritance' do
  class DogBase
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      'woof'
    end
  end

  class Chihuahua < DogBase
    def wag
      :happy
    end

    def bark
      'yip'
    end
  end

  it 'sets the subclasses parent as one of the ancestors' do
    expect(Chihuahua.ancestors.include?(DogBase)).to eq(__)
  end

  it 'will ultimately inherit from Object' do
    expect(Chihuahua.ancestors.include?(Object)).to eq(__)
  end

  it 'inherits behaviour from the parent class' do
    chico = Chihuahua.new('Chico')
    expect(chico.name).to eq(__)
  end

  it 'can add behaviour in a subclass that does not exist in the parent class' do
    chico = Chihuahua.new('Chico')
    expect(chico.wag).to eq(__)

    expect do
      fido = DogBase.new('Fido')
      fido.wag
    end.to raise_error(__)
  end

  it 'can modify behaviour in a subclass' do
    chico = Chihuahua.new('Chico')
    expect(chico.bark).to eq(__)

    fido = DogBase.new('Fido')
    expect(fido.bark).to eq(__)
  end

  class BullDog < DogBase
    def bark
      super.upcase
    end
  end

  it 'can invoke the parent method behaviour using super' do
    ralph = BullDog.new('Ralph')
    expect(ralph.bark).to eq(__)
  end

  class GreatDane < DogBase
    def growl
      super.bark.upcase
    end
  end

  it 'is not able to use super to invoke different methods' do
    george = GreatDane.new('George')
    expect { george.growl }.to raise_error(__)
  end
end
