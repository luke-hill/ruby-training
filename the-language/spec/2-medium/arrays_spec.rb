# frozen_string_literal: true

RSpec.describe 'Ruby Arrays' do
  it 'can be created like any other object' do
    empty = []

    expect(empty.class).to eq __
    expect(empty.size).to eq __
  end

  it 'can also be created using an array literal' do
    array = []

    array[0] = 1
    expect(array).to eq([1])

    array[1] = 2
    expect(array).to eq([1, __])

    array << 333
    expect(array).to eq(__)
  end

  it 'provides the subscript operator for accessing elements' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(array[0]).to eq(__)
    expect(array[3]).to eq(__)

    # What do you thing will happen here?
    expect(array[-1]).to eq(__)
    expect(array[-3]).to eq(__)
  end

  it 'has methods for accessing the beginning and end of the array' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(array.first).to eq(__)
    expect(array.last).to eq(__)
  end

  it 'can be sliced' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(array.slice(0, 1)).to eq(__)
    expect(array.slice(0, 2)).to eq(__)
    expect(array.slice(3, 3)).to eq(__)
    expect(array.slice(2, 20)).to eq(__)
    expect(array.slice(4, 0)).to eq(__)
    expect(array.slice(4, 10)).to eq(__)
    expect(array.slice(5, 0)).to eq(__)
  end

  it 'is similar to a range' do
    expect((1..5).class).to eq(__)
    expect([1, 2, 3, 4, 5]).not_to eq((1..5))
    expect(__).to eq((1..5).to_a)
    expect(__).to eq((1...5).to_a)
  end

  it 'can be sliced by a range' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(__).to eq array[0..2]
    expect(__).to eq array[0...2]
    expect(__).to eq array[2..-1]
    expect(__).to eq array[-2..1]
  end

  it 'can be used as a stack' do
    array = [1, 2]

    array.push('on the end')

    expect(array).to eq(__)

    value = array.pop
    expect(value).to eq(__)
    expect(array).to eq(__)
  end

  it 'can be used as a queue' do
    array = [:first, :second]
    array.push(:third)

    value = array.shift
    expect(value).to eq(__)
    expect(array).to eq(__)

    # Sometimes you need to force things to the front of a queue
    # A bit like if someone was pushing in at the supermarket!
    array.unshift(value)

    expect(array).to eq(__)
  end
end
