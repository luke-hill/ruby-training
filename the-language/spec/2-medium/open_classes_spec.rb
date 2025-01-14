RSpec.describe 'Classes can be opened in ruby' do
  class Hamster
    def eat
      'MUNCH!'
    end
  end

  it 'eats as defined' do
    hammy = Hamster.new
    expect(hammy.eat).to eq('MUNCH!')
  end

  # Open the existing Hamster class and add a new method.
  class Hamster
    def nibble
      'mmmm'
    end
  end

  it 'can now nibble too' do
    hammy = Hamster.new
    expect(hammy.nibble).to eq('mmmm')
    expect(hammy.eat).to eq('MUNCH!')
  end

  class Integer
    def even_number?
      (self % 2) == 0
    end
  end

  it 'is possible to reopen built in classes' do
    expect(1.even_number?).to eq(false)
    expect(2.even_number?).to eq(true)
  end
end
