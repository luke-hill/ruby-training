RSpec.describe "ruby's blocks" do
  def method_with_block
    result = yield
    result
  end

  it "can pass a block to a method" do
    yielded_result = method_with_block { 1 + 2 }
    expect( yielded_result ).to eq( __ )
  end

  it "can pass a block using do end" do
    yielded_result = method_with_block do 1 + 2 end
    expect( yielded_result ).to eq( __ )
  end

  def method_with_block_arguments
    yield("Jim")
  end

  it "can pass an argument to a block" do
    method_with_block_arguments do |argument|
      expect( argument ).to eq( __ )
    end
  end

  def many_yields
    yield(:peanut)
    yield(:butter)
    yield(:and)
    yield(:jelly)
  end

  it "can yield multiple times" do
    result = []
    many_yields { |item| result << item }
    expect( result ).to eq( __ )
  end

  def yield_tester
    if block_given?
      yield
    else
      :no_block
    end
  end

  it "can check if a method has been called with a block" do
    expect( yield_tester { :with_block } ).to eq( __ )
    expect( yield_tester ).to eq( __ )
  end

  it "can affect variables from the code where the block is defined" do
    value = :initial_value
    method_with_block { value = :modified_in_a_block }
    expect( value ).to eq( __ )
  end

  it "can assign a block to variable and be called explicitly" do
    add_one = lambda { |n| n + 1 }
    expect( add_one.call(10) ).to eq( __ )

    # Alternative calling syntax
    expect( add_one[10] ).to eq( __ )
  end

  it "can pass a stand-alone block to method expecting a block" do
    make_upper = lambda { |n| n.upcase }
    result = method_with_block_arguments(&make_upper)
    expect( result ).to eq( __ )
  end

  def method_with_explicit_block(&block)
    block.call(10)
  end

  it "can define a method with an explicit block argument" do
    expect( method_with_explicit_block { |n| n * 2 } ).to eq( __ )

    add_one = lambda { |n| n + 1 }
    expect( method_with_explicit_block(&add_one) ).to eq( __ )
  end

end
