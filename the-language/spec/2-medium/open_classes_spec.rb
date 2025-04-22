# frozen_string_literal: true

RSpec.describe 'Classes can be opened in ruby' do
  class Hamster
    def eat
      'MUNCH!'
    end
  end

  it 'eats as defined' do
    hammy = Hamster.new
    expect(hammy.eat).to eq(__)
  end

  # Open the existing Hamster class and add a new method.
  class Hamster
    def nibble
      'mmmm'
    end
  end

  it 'can now nibble too' do
    hammy = Hamster.new
    expect(hammy.nibble).to eq(__)
    expect(hammy.eat).to eq(__)
  end

  class Integer
    def even_number?
      (self % 2) == 0
    end
  end

  it 'is possible to reopen built in classes' do
    expect(1.even_number?).to eq(__)
    expect(2.even_number?).to eq(__)
  end

  # Open the existing Hamster class and rewrite a method.
  class Hamster
    def nibble
      'i am nibbling differently now'
    end
  end

  it 'nibbles differently' do
    hammy = Hamster.new
    expect(hammy.nibble).to eq(__)
    expect(hammy.eat).to eq(__)
  end

  # Open an existing standard class and rewrite a method.
  class String
    def to_s
      'Well I guess I can be co-erced!'
    end
  end

  it 'alters behaviour for our instances of the modified class' do
    expect('String'.to_s).to eq(__)
    expect(1.to_s).to eq(__)
    expect(:symbol.to_s).to eq(__)
    expect('A very long string'.to_s).to eq(__)
    expect(Hamster.new.to_s).to eq(__)
  end

  # Open all object types and rewrite a method.
  class Object
    def to_s
      'Interpolation will be affected...'
    end
  end

  it 'can have very strange behaviour for classes' do
    expect(Hamster.new.to_s).to eq(__)
    expect("Hello to you Mr. #{Hamster.new}").to eq(__)
  end
end
