# frozen_string_literal: true

RSpec.describe 'Iterations' do
  it 'has an each method on arrays' do
    expect([].methods.include?(:each)).to eq(__)
  end

  it 'can iterate using `#each` and a do / end block' do
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    expect(sum).to eq(__)
  end

  it 'can use {} instead of a do / end block' do
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }
    expect(sum).to eq(__)
  end

  it 'can `#break` out of the iteration' do
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each do |item|
      break if item > 3

      sum += item
    end
    expect(sum).to eq(__)
  end

  it 'can transform elements of an array using `#map`' do
    array = [1, 2, 3]
    mapped_array = array.map { |item| item + 10 }
    expect(mapped_array).to eq(__)

    # NB: `#collect` is another name for `#map`
    collected_array = array.collect { |item| item + 10 }
    expect(collected_array).to eq(__)
  end

  it 'can transform elements of an array in-place using `#map!`' do
    array = [1, 2, 3]
    array.map! { |item| item + 10 }
    expect(array).to eq(__)
  end

  it 'can `#select` all elements that pass certain criteria' do
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    expect(even_numbers).to eq(__)

    # NB: `#find_all` is another name for `#select`
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    expect(more_even_numbers).to eq(__)
  end

  it 'can `#select` all elements (then update itself in-place), that pass certain criteria' do
    array = [1, 2, 3, 4, 5, 6]
    array.select! { |item| (item % 2) == 0 }
    expect(array).to eq(__)
  end

  it 'can check if all elements pass certain criteria' do
    array = [1, 2, 3, 4, 5, 6]
    all_even = array.all? { |item| (item % 2) == 0 }
    expect(all_even).to eq(__)
  end

  it 'can `#detect` the first element that passes certain criteria' do
    array = ['Jim', 'Bill', 'Clarence', 'Doug', 'Eli']

    expect(array.detect { |item| item.length > 4 }).to eq(__)

    # NOTE: `#find` is another name for `#detect`
    expect(array.find { |item| item.length > 4 }).to eq(__)
  end

  it 'can `#inject` a value - and probably blow your mind' do
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    expect(result).to eq(__)

    result2 = [2, 3, 4].inject(1) { |product, item| product * item }
    expect(result2).to eq(__)

    result3 = ['a', 'b', 'c'].inject('') { |string, item| string + item }
    expect(result3).to eq(__)

    # Describe in your own words what `#inject` does?
  end

  it 'can use iteration methods on all collections, not just arrays' do
    # Ranges act like a collection, but when using #map, they need to be co-erced into a new object type
    result = (1..3).map { |item| item + 10 }
    expect(result).to eq(__)

    result = (5...10).map { |item| item + 10 }
    expect(result).to eq(__)

    # NOTE: You can create your own custom Objects that can work with these methods
    # like #each, #map, #select and other enumerable methods
  end
end
