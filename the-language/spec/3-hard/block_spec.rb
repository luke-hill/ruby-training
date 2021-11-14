RSpec.describe 'blocks' do
  def method_with_block
    result = yield
    result
  end

  it 'can pass a block to a method' do
    yielded_result = method_with_block { 1 + 2 }
    expect(yielded_result).to eq(3)
  end

  it 'can pass a block using do end' do
    yielded_result = method_with_block do
      1 + 2
    end
    expect(yielded_result).to eq(3)
  end

  def method_with_block_arguments
    yield('Jim')
  end

  it 'can pass an argument to a block' do
    method_with_block_arguments do |argument|
      expect(argument).to eq('Jim')
    end
  end

  def many_yields
    yield(:peanut)
    yield(:butter)
    yield(:and)
    yield(:jelly)
  end

  it 'can yield multiple times' do
    result = []
    many_yields { |item| result << item }
    expect(result).to eq([:peanut, :butter, :and, :jelly])
  end

  def yield_tester
    if block_given?
      yield
    else
      :no_block
    end
  end

  it 'can check if a method has been called with a block' do
    expect(yield_tester { :with_block }).to eq(:with_block)
    expect(yield_tester).to eq(:no_block)
  end

  it 'can affect variables from the code where the block is defined' do
    value = :initial_value
    method_with_block { value = :modified_in_a_block }
    expect(value).to eq(:modified_in_a_block )
  end

  it 'can assign a block to variable and be called explicitly' do
    add_one = lambda do |n|
      n + 1
    end
    expect(add_one.call(10)).to eq(11)

    # Alternative calling syntax
    expect(add_one[10]).to eq(11)
  end

  it 'can pass a stand-alone block to method expecting a block' do
    make_upper = lambda do |n|
      n.upcase
    end
    result = method_with_block_arguments do |argument|
      make_upper.call(argument)
    end
    expect(result).to eq('JIM')
  end

  def method_with_explicit_block(&block)
    block.call(10)
  end

  it 'can define a method with an explicit block argument' do
    expect(method_with_explicit_block { |n| n * 2 }).to eq(20)

    add_one = lambda do |n|
      n + 1
    end
    # This is a slightly shorter syntax for what we did on Lines 75-77
    expect(method_with_explicit_block(&add_one)).to eq(11)
  end
end
