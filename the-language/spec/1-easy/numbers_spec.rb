RSpec.describe 'numbers' do
  it 'can be created by just typing the number' do
    integer = 42
    expect(integer.is_a?(Integer)).to eq(__)
    float = 42.1
    expect(float.is_a?(Float)).to eq(__)
  end

  it 'has different object types for the different types of numbers' do
    expect(74.class).to eq(__)
    expect(-50.class).to eq(__)
    expect(74.3.class).to eq(__)
    expect(Math::PI.class).to eq(__)
  end

  it 'cannot be instantiated like other objects' do
    expect { Integer.new(42) }.to raise_error(__)
  end

  it 'can update the original integer by using a variety of operations' do
    original_number = 1
    number_to_add  = 100
    new_number = original_number + number_to_add

    expect(new_number).to eq(__)

    new_number += original_number

    expect(new_number).to eq(__)
  end

  it 'cannot perform mathematical operations with objects that are not understood' do
    expect { 42 + 'not a number' }.to raise_error(__)
  end

  it 'can convert other objects to numbers in a variety of ways' do
    expect('123'.to_i).to eq(__)
    expect('123'.to_f).to eq(__)
    expect(Integer('456')).to eq(__)
    expect(Float('456')).to eq(__)
  end

  it 'can also try to convert garbage strings numbers' do
    expect('12ab34'.to_i).to eq(__)
    expect('cd34ef'.to_f).to eq(__)
  end

  it 'can list all of the digits of a number' do
    # NB: This method does look a bit odd because of the return value
    number = 123456

    expect(number.digits).to eq(__)
    expect(number.digits[3]).to eq(__)
  end

  it 'also inherits from a parent class' do
    integer = 42
    expect(integer.is_a?(Numeric)).to eq(__)
    float = 42.1
    expect(float.is_a?(Numeric)).to eq(__)
  end
end
