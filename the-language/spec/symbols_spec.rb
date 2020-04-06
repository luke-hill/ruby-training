# frozen_string_literal: true

RSpec.describe 'A symbol in Ruby' do
  it 'is a Symbol' do
    symbol = :a_symbol
    expect(symbol.is_a?(Symbol)).to eq(__)
  end

  it 'can compare with other symbols' do
    a_symbol        = :a_symbol
    the_same_symbol = :a_symbol
    another_symbol  = :another_symbol

    expect(a_symbol == the_same_symbol).to eq(__)
    expect(a_symbol == another_symbol).to eq(__)
  end

  it 'is a single, internal object' do
    a_symbol        = :a_symbol
    the_same_symbol = :a_symbol

    expect(a_symbol.object_id == the_same_symbol.object_id).to eq(__)
  end

  it 'is created for every method name' do
    symbols_as_strings = Symbol.all_symbols.map { |symbol| symbol.to_s }

    # split is a method on String that we have used previously
    expect(symbols_as_strings.include?('split')).to eq(__)
  end

  MagicNumber = 3
  it 'is created for every constant' do
    symbols_as_strings = Symbol.all_symbols.map { |symbol| symbol.to_s }

    expect(symbols_as_strings.include?('MagicNumber')).to eq(__)
  end

  it 'can be created from a string' do
    string = 'helloWorld'

    expect(string.to_sym).to eq(__)
  end

  it 'can be created with spaces' do
    symbol = :"hello world"

    expect(symbol).to eq(__)
  end

  it 'can be created with interpolated values' do
    value = 'world'
    symbol = :"hello #{value}"

    expect(symbol).to eq(__)
  end

  it 'can be interpolated into a string' do
    symbol = :world
    string = "hello #{symbol}"

    expect(string).to eq(__)
  end

  it 'is not a string' do
    symbol = :world

    expect(symbol.is_a?(String)).to eq(__)
    expect(symbol == 'ruby').to eq(__)
  end

  it "doesn't have string methods" do
    symbol = :world

    expect(symbol.respond_to?(:reverse)).to eq(__)
    expect(symbol.respond_to?(:split)).to eq(__)
  end

  it "can't be concatenated" do
    expect { :hello + :world }.to raise_error(__)
  end

  it 'can be created dynamically' do
    expect(('hello' + 'world').to_sym).to eq(__)
  end
end
