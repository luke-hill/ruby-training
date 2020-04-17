# frozen_string_literal: true

RSpec.describe 'iterating in ruby' do
  it 'has an each method on arrays' do
    expect([].methods.include?(:each)).to eq(true)
  end

  it 'can iterate using each' do
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    expect(sum).to eq(6)
  end

  it 'can use {} instead of do end' do
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }
    expect(sum).to eq(6)
  end

  it 'can `break` out of the iteration' do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each do |item|
      break if item > 3

      sum += item
    end
    expect(sum).to eq(6)
  end

  it 'can transform elements of an array using `collect`' do
    array = [1, 2, 3]
    new_array = array.collect { |item| item + 10 }
    expect(new_array).to eq([11, 12, 13])

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }
    expect(another_array).to eq([11, 12, 13])
  end

  it 'can select certain elements' do
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    expect(even_numbers).to eq([2, 4, 6])

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    expect(more_even_numbers).to eq([2, 4, 6])
  end

  it 'can detect the first matching element' do
    array = ['Jim', 'Bill', 'Clarence', 'Doug', 'Eli']

    expect(array.detect { |item| item.length > 4 }).to eq('Clarence')

    # NOTE: 'find' is another name for the 'detect' operation
    expect(array.find { |item| item.length > 4 }).to eq('Clarence')
  end

  it 'can `inject` a value - and probably blow your mind' do
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    expect(result).to eq(9)

    result2 = [2, 3, 4].inject(1) { |product, item| product * item }
    expect(result2).to eq(24)

    result3 = ['a', 'b', 'c'].inject('') { |string, item| string + item }
    expect(result3).to eq(__)

    # Describe in your own words what inject does.
  end

  it 'can use iteration methods on all collections, not just array' do
    # Ranges act like a collection
    result = (1..3).map { |item| item + 10 }
    expect(result).to eq([11, 12, 13])

    result = (5...10).map { |item| item + 10 }
    expect(result).to eq(__)

    # NOTE: You can create your own collections that work with each,
    # map, select, and other enumerable methods
  end
end
