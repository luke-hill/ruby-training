# frozen_string_literal: true

RSpec.describe 'Numbers' do
  it 'can be created by typing the literal number' do
    integer = 42
    expect(integer.is_a?(Integer)).to eq(true)
    float = 42.1
    expect(float.is_a?(Float)).to eq(true)
  end

  it 'has different object types for the different classifications of numbers' do
    expect(74.class).to eq(Integer)
    expect(-50.class).to eq(Integer)
    expect(74.3.class).to eq(Float)
    expect(Math::PI.class).to eq(Float)
  end

  it 'cannot be instantiated as if it were a regular object' do
    expect { Integer.new(42) }.to raise_error(NoMethodError)
  end

  it 'can update the original integer by using a variety of operators' do
    original_number = 1
    number_to_add  = 100
    new_number = original_number + number_to_add

    expect(new_number).to eq(101)

    new_number += original_number

    expect(new_number).to eq(102)
  end

  it 'cannot perform mathematical operations with objects that are not understood' do
    expect { 42 + 'not a number' }.to raise_error()
  end

  it 'can convert other objects to numbers in a variety of ways' do
    expect('123'.to_i).to eq(123)
    expect('123'.to_f).to eq(123.00)
    expect(Integer('456')).to eq(456)
    expect(Float('456')).to eq(456.0)
  end

  it 'can also convert garbage strings to numbers' do
    expect('12ab34'.to_i).to eq(12)
    expect('cd34ef'.to_f).to eq(0.0)
  end

  it 'can list all the digits of a number' do
    # NB: This method will seem weird because of the way the answer is returned
    number = 123456

    expect(number.digits).to eq([6,5,4,3,2,1])
    expect(number.digits[3]).to eq(3)
  end

  it 'inherits from parent classes' do
    integer = 42
    expect(integer.is_a?(Numeric)).to eq(true)
    float = 42.1
    expect(float.is_a?(Numeric)).to eq(true)
  end

  it 'can perform basic modular arithmetic operations' do
    expect(20 % 2).to eq(0)
    expect(20 % 3).to eq(2)
    expect(20 % 4).to eq(0)
    expect(20 % 5).to eq(0)
    expect(20 % 6).to eq(2)
  end

  it 'can check if an integer is even or odd' do
    expect(2.even?).to eq(true)
    expect(3.even?).to eq(false)
    expect(4.even?).to eq(true)

    expect(2.odd?).to eq(false)
    expect(3.odd?).to eq(true)
    expect(4.odd?).to eq(false)
  end

  it 'cannot check if a float is even or odd' do
    expect { (2.4).even? }.to raise_error(NoMethodError)
    expect { (2.4).odd? }.to raise_error(NoMethodError)
  end
end
