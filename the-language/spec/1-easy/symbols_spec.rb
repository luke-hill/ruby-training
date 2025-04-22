# frozen_string_literal: true

RSpec.describe 'Symbols' do
  it 'is a type of symbol class' do
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

  it 'is a single, non-unique, internal object' do
    a_symbol        = :a_symbol
    the_same_symbol = :a_symbol

    expect(a_symbol.object_id == the_same_symbol.object_id).to eq(__)
  end

  it 'is created for every method name' do
    symbols_as_strings = Symbol.all_symbols.map { |symbol| symbol.to_s }

    # `#split` is a method on String that we have used previously
    expect(symbols_as_strings.include?('split')).to eq(__)
  end

  MAGIC_NUMBER = 3
  it 'is created for every constant' do
    symbols_as_strings = Symbol.all_symbols.map { |symbol| symbol.to_s }

    expect(symbols_as_strings.include?('MAGIC_NUMBER')).to eq(__)
  end

  it 'can be created from a string' do
    string = 'helloWorld'

    expect(string.to_sym).to eq(__)
  end

  it 'can be created with spaces' do
    # NB: Symbols traditionally are snake_case only (Please don't use spaces!)
    symbol = :"hello world"

    expect(symbol.is_a?(Symbol)).to eq(__)
  end

  it 'can be created with an underscore or a hyphen' do
    underscore_symbol = :hello_world
    # NB: Symbols traditionally are snake_case only (Please don't use hyphens also!)
    hyphenated_symbol = :"hello-world"

    expect(underscore_symbol.is_a?(Symbol)).to eq(__)
    expect(hyphenated_symbol.is_a?(Symbol)).to eq(__)
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

  it 'does not have string methods' do
    symbol = :world

    expect(symbol.respond_to?(:reverse)).to eq(__)
    expect(symbol.respond_to?(:split)).to eq(__)
  end

  it 'cannot be concatenated' do
    expect { :hello + :world }.to raise_error(__)
  end

  it 'can be created dynamically' do
    expect(('hello' + 'world').to_sym).to eq(__)
  end
end
