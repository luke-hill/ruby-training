RSpec.describe 'symbols' do
  it 'is a type of symbol class' do
    symbol = :a_symbol
    expect(symbol.is_a?(Symbol)).to eq(true)
  end

  it 'can compare with other symbols' do
    a_symbol        = :a_symbol
    the_same_symbol = :a_symbol
    another_symbol  = :another_symbol

    expect(a_symbol == the_same_symbol).to eq(true)
    expect(a_symbol == another_symbol).to eq(false)
  end

  it 'is a single, non-unique internal object' do
    a_symbol        = :a_symbol
    the_same_symbol = :a_symbol

    expect(a_symbol.object_id == the_same_symbol.object_id).to eq(true)
  end

  it 'is created for every method name' do
    symbols_as_strings = Symbol.all_symbols.map { |symbol| symbol.to_s }

    # split is a method on String that we have used previously
    expect(symbols_as_strings.include?('split')).to eq(true)
  end

  MAGIC_NUMBER = 3
  it 'is created for every constant' do
    symbols_as_strings = Symbol.all_symbols.map { |symbol| symbol.to_s }

    expect(symbols_as_strings.include?('MAGIC_NUMBER')).to eq(true)
  end

  it 'can be created from a string' do
    string = 'helloWorld'

    expect(string.to_sym).to eq(:helloWorld)
  end

  it 'can be created with spaces' do
    #NB: This is not common.. please don't do this!
    symbol = :"hello world"

    expect(symbol.is_a?(Symbol)).to eq(true)
  end

  it 'can be created with an underscore or a hyphen' do
    underscore_symbol = :hello_world
    #NB: The hyphenated variant is not common, please don't do this!
    hyphenated_symbol = :"hello-world"

    expect(underscore_symbol.is_a?(Symbol)).to eq(true)
    expect(hyphenated_symbol.is_a?(Symbol)).to eq(true)
  end

  it 'can be created with interpolated values' do
    value = 'world'
    symbol = :"hello #{value}"

    expect(symbol).to eq(:"hello world")
  end

  it 'can be interpolated into a string' do
    symbol = :world
    string = "hello #{symbol}"

    expect(string).to eq("hello world")
  end

  it 'is not a string' do
    symbol = :world

    expect(symbol.is_a?(String)).to eq(false)
    expect(symbol == 'ruby').to eq(false)
  end

  it "doesn't have string methods" do
    symbol = :world

    expect(symbol.respond_to?(:reverse)).to eq(false)
    expect(symbol.respond_to?(:split)).to eq(false)
  end

  it "can't be concatenated" do
    expect { :hello + :world }.to raise_error(NoMethodError)
  end

  it 'can be created dynamically' do
    expect(('hello' + 'world').to_sym).to eq(:helloworld)
  end
end
