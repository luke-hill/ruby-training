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

  it 'nibbles differently' do
    # Open the existing Hamster class and rewrite a method.
    class Hamster
      def nibble
        'i am nibbling differently now'
      end
    end

    hammy = Hamster.new
    expect(hammy.nibble).to eq(__)
    expect(hammy.eat).to eq(__)
  end

  # Open an existing standard class and rewrite a method.
  class String
    def itself
      'Well I am myself of course!'
    end
  end

  it 'alters behaviour for our instances of the modified class' do
    expect('String'.itself).to eq(__)
    expect(1.itself).to eq(__)
    expect(:symbol.itself).to eq(__)
    expect('A very long string'.itself).to eq(__)
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
