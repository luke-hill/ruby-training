RSpec.describe 'iterating in ruby' do
  it 'has an each method on arrays' do
    expect([].methods.include?(:each)).to eq(__)
  end

  it 'can iterate using each and a do end block' do
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    expect(sum).to eq(__)
  end

  it 'can use {} instead of a do end block' do
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }
    expect(sum).to eq(__)
  end

  it 'can `break` out of the iteration' do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each do |item|
      break if item > 3

      sum += item
    end
    expect(sum).to eq(__)
  end

  it 'can transform elements of an array using `map`' do
    array = [1, 2, 3]
    mapped_array = array.map { |item| item + 10 }
    expect(mapped_array).to eq(__)

    # NOTE: 'collect' is another name for the 'map' operation
    collected_array = array.collect { |item| item + 10 }
    expect(collected_array).to eq(__)
  end

  it 'can select certain elements' do
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    expect(even_numbers).to eq(__)

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    expect(more_even_numbers).to eq(__)
  end

  it 'can detect the first matching element' do
    array = ['Jim', 'Bill', 'Clarence', 'Doug', 'Eli']

    expect(array.detect { |item| item.length > 4 }).to eq(__)

    # NOTE: 'find' is another name for the 'detect' operation
    expect(array.find { |item| item.length > 4 }).to eq(__)
  end

  it 'can `inject` a value - and probably blow your mind' do
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    expect(result).to eq(__)

    result2 = [2, 3, 4].inject(1) { |product, item| product * item }
    expect(result2).to eq(__)

    result3 = ['a', 'b', 'c'].inject('') { |string, item| string + item }
    expect(result3).to eq(__)

    # Describe in your own words what inject does.
  end

  it 'can use iteration methods on all collections, not just array' do
    # Ranges act like a collection, but when using map, they need to be co-erced into a new object type
    result = (1..3).map { |item| item + 10 }
    expect(result).to eq(__)

    result = (5...10).map { |item| item + 10 }
    expect(result).to eq(__)

    # NOTE: You can create your own custom Objects that can work with these methods
    # like 'each', 'map', 'select' and other enumerable methods
  end
end
