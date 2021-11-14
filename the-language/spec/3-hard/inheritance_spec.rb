RSpec.describe 'inheritance' do
  class OtherDog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      'woof'
    end
  end

  class Chihuahua < OtherDog
    def wag
      :happy
    end

    def bark
      'yip'
    end
  end

  it 'sets the subclass parent as an ancestor' do
    expect(Chihuahua.ancestors.include?(OtherDog)).to eq(true)
  end

  it 'will ultimately inherit from Object' do
    expect(Chihuahua.ancestors.include?(Object)).to eq(true)
  end

  it 'inherits behaviour from a parent class' do
    chico = Chihuahua.new('Chico')
    expect(chico.name).to eq('Chico')
  end

  it 'can add behaviour in subclass that does not exist in the parent class' do
    chico = Chihuahua.new('Chico')
    expect(chico.wag).to eq(:happy)

    expect do
      fido = OtherDog.new('Fido')
      fido.wag
    end.to raise_error(NoMethodError)
  end

  it 'can modify behaviour in a subclass' do
    chico = Chihuahua.new('Chico')
    expect(chico.bark).to eq('yip')

    fido = OtherDog.new('Fido')
    expect(fido.bark).to eq('woof')
  end

  class BullDog < OtherDog
    def bark
      super.upcase
    end
  end

  it 'can invoke the parent behaviour using super' do
    ralph = BullDog.new('Ralph')
    expect(ralph.bark).to eq('WOOF')
  end

  class GreatDane < OtherDog
    def growl
      super.bark.upcase
    end
  end

  it 'is not able to use super to invoke different methods' do
    george = GreatDane.new('George')
    expect { george.growl }.to raise_error(NoMethodError)
  end
end
