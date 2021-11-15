RSpec.describe 'numbers' do
  it 'can be created by just typing the number' do
    integer = 42
    expect(integer.is_a?(Integer)).to eq(true)
    float = 42.1
    expect(float.is_a?(Float)).to eq(true)
  end

  it 'has different object types for the different types of numbers' do
    expect(74.class).to eq(Integer)
    expect(-50.class).to eq(Integer)
    expect(74.3.class).to eq(Float)
    expect(Math::PI.class).to eq(Float)
  end

  it 'cannot be instantiated like other objects' do
    expect { Integer.new(42) }.to raise_error(NoMethodError)
  end

  it 'can update the original integer by using a variety of operations' do
    original_number = 1
    number_to_add  = 100
    new_number = original_number + number_to_add

    expect(new_number).to eq(101)

    new_number += original_number

    expect(new_number).to eq(102)
  end

  it 'cannot perform mathematical operations with objects that are not understood' do
    expect { 42 + 'not a number' }.to raise_error(TypeError)
  end

  it 'can convert other objects to numbers in a variety of ways' do
    expect('123'.to_i).to eq(123)
    expect('123'.to_f).to eq(123.0)
    expect(Integer('456')).to eq(456)
    expect(Float('456')).to eq(456.0)
  end

  it 'can also try to convert garbage strings numbers' do
    expect('12ab34'.to_i).to eq(12)
    expect('cd34ef'.to_f).to eq(0.0)
  end

  it 'can list all of the digits of a number' do
    # NB: This method does look a bit odd because of the return value
    number = 123456

    expect(number.digits).to eq([6, 5, 4, 3 ,2, 1])
    expect(number.digits[3]).to eq(3)
  end

  it 'also inherits from a parent class' do
    integer = 42
    expect(integer.is_a?(Numeric)).to eq(true)
    float = 42.1
    expect(float.is_a?(Numeric)).to eq(true)
  end
end
