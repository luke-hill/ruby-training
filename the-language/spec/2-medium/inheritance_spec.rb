# frozen_string_literal: true

RSpec.describe 'inheritance' do
  class OtherDog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      'WOOF'
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
    expect(Chihuahua.ancestors.include?(OtherDog)).to eq(__)
  end

  it 'will ultimately inherit from Object' do
    expect(Chihuahua.ancestors.include?(Object)).to eq(__)
  end

  it 'inherits behaviour from a parent class' do
    chico = Chihuahua.new('Chico')
    expect(chico.name).to eq(__)
  end

  it 'can add behaviour in subclass, not in a parent class' do
    chico = Chihuahua.new('Chico')
    expect(chico.wag).to eq(__)

    expect do
      fido = OtherDog.new('Fido')
      fido.wag
    end.to raise_error(__)
  end

  it 'can modify behaviour in a subclass' do
    chico = Chihuahua.new('Chico')
    expect(chico.bark).to eq(__)

    fido = OtherDog.new('Fido')
    expect(fido.bark).to eq(__)
  end

  class BullDog < OtherDog
    def bark
      super + ', GROWL'
    end
  end

  it 'can invoke the parent behaviour using super' do
    ralph = BullDog.new('Ralph')
    expect(ralph.bark).to eq(__)
  end

  class GreatDane < OtherDog
    def growl
      super.bark + ', GROWL'
    end
  end

  it "can't invoke other methods using super" do
    george = GreatDane.new('George')
    expect do
      george.growl
    end.to raise_error(__)
  end
end
