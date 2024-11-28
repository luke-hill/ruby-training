RSpec.describe 'Arrays' do
  it 'can be created like any other object' do
    empty = Array.new

    expect(empty.class).to eq(Array)
    expect(empty.size).to eq(0)
  end

  it 'can also be created using an array literal' do
    array = []

    array[0] = 1
    expect(array).to eq([1])

    array[1] = 2
    expect(array).to eq([1, 2])

    # This is sometimes referred to as the shovel operator
    array << 333
    expect(array).to eq([1, 2, 333])
  end

  it 'provides the subscript (index), operator for accessing elements' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(array[0]).to eq('New York')
    expect(array[3]).to eq('Milan')

    # What do you thing will happen here?
    expect(array[-1]).to eq('Milan')
    expect(array[-3]).to eq('Paris')
  end

  it 'has methods for accessing the beginning and end of the array' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(array.first).to eq('New York')
    expect(array.last).to eq('Milan')
  end

  it 'can be sliced using #slice with 2 arguments' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(array.slice(0, 1)).to eq(['New York']) # Starts at index 0, takes 1 element
    expect(array.slice(0, 2)).to eq(['New York', 'Paris']) # Starts at index 0, takes 2 elements
    expect(array.slice(3, 3)).to eq(['Milan']) # Starts at index 3, but only 1 element exists
    expect(array.slice(2, 20)).to eq(['London', 'Milan']) # Starts at index 2, but only 2 elements exist
    expect(array.slice(4, 0)).to eq([]) # Index 4 is beyond bounds, returns empty array
    expect(array.slice(4, 10)).to eq([]) # Index 4 is beyond bounds, returns nil
    expect(array.slice(5, 0)).to eq(nil) # Index 5 is beyond bounds, returns nil
    expect(array.slice(1, 1)).to eq(['Paris']) # Starts at index 1, takes 1 element
    expect(array.slice(2, 1)).to eq(['London']) # Starts at index 2, takes 1 element
  end

  it 'is similar to a range' do
    expect((1..5).class).to eq(Range)
    # Given these two items are not equal what do we expect to do with the tests below?
    expect([1, 2, 3, 4, 5]).not_to eq((1..5))
    expect([1, 2, 3, 4, 5]).to eq((1..5).to_a)
    expect([1, 2, 3, 4]).to eq((1...5).to_a)
  end

  it 'can be sliced by a range' do
    array = ['New York', 'Paris', 'London', 'Milan']

    expect(['New York', 'Paris', 'London']).to eq(array[0..2])
    expect(['New York', 'Paris']).to eq(array[0...2])
    expect(['London', 'Milan']).to eq(array[2..-1]) # starts at index 2 and goes to the last element
    expect([]).to eq(array[-2..1]) # is an invalid range (end index before start)
  end

  it 'can be used as a stack' do
    array = [1, 2]

    array.push('on the end')

    expect(array).to eq([1, 2, 'on the end'])

    value = array.pop
    expect(value).to eq('on the end')
    expect(array).to eq([1, 2])
  end

  it 'can be used as a queue' do
    array = [:first, :second]
    array.push(:third)
    expect(array).to eq([:first, :second, :third])

    value = array.shift
    expect(value).to eq(:first)
    expect(array).to eq([:second, :third])

    # Sometimes you need to force things to the front of a queue
    # A bit like if someone was pushing in at the supermarket!
    array.unshift(value)

    expect(array).to eq([:first, :second, :third])
  end

  it 'has short-hand notation for arrays of strings or symbols' do
    string_array = ['Welcome', 'to', 'the', 'joinery']
    simplified_string_array = %w[Welcome to the joinery]

    expect(string_array == simplified_string_array).to eq(true)

    symbol_array = [:foo, :bar, :baz, :bay]
    simplified_symbol_array = %i[foo bar baz bay]

    expect(symbol_array == simplified_symbol_array).to eq(true)
  end
end
