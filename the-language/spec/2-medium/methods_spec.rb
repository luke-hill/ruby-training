# frozen_string_literal: true

def a_global_method(a, b)
  a + b
end

RSpec.describe 'Methods' do
  it 'is possible to call a global method' do
    expect(a_global_method(5, 9)).to eq(__)
  end

  it 'is possible to call a method without parentheses' do
    expect(a_global_method 4, 8).to eq(__)
  end

  it 'is sometimes ambiguous to leave out parentheses' do
    # We have used a string and eval here because the code below causes
    # a syntax error.
    code = 'a_global_method 4, a_global_method 3, 2'

    # Ruby doesn't know if this line means:
    #
    #   a_global_method(4, a_global_method(3, 2))
    #
    # or
    #
    #  a_global_method(4, a_global_method(3), 2)

    expect { eval(code) }.to raise_error(__)
  end

  it 'is not possible to call methods with the wrong number of arguments' do
    # HINT: Fill in the error and part of the message
    expect { a_global_method }.to raise_error(__, /__/)

    # HINT: Fill in the error and part of the message
    expect { a_global_method(1, 2, 3) }.to raise_error(__, /__/)
  end

  def a_method_with_defaults(a, b = :default_value)
    [a, b]
  end

  it 'is possible to use default values' do
    expect(a_method_with_defaults(1)).to eq([1, __])
    expect(a_method_with_defaults(1, 2)).to eq([1, __])
  end

  def method_with_var_args(*args)
    args
  end

  it 'is possible to create a methods with a variable number of arguments' do
    expect(method_with_var_args.class).to eq(__)
    expect(method_with_var_args).to eq(__)
    expect(method_with_var_args(1)).to eq(__)
    expect(method_with_var_args(1, 2)).to eq(__)
  end

  def method_with_explicit_return
    :a_value
    return :the_value
    :i_am_redundant_code
  end

  it 'is possible to return an explicit value' do
    expect(method_with_explicit_return).to eq(__)
  end

  def method_without_explicit_return
    :redundant_value
    :useful_value
  end

  it 'returns the last evaluated statement' do
    expect(method_without_explicit_return).to eq(__)
  end

  class MyClass
    def the_method
      :the_value
    end

    def calls_the_method
      the_method
    end

    def calls_the_method_on_self
      self.the_method
    end

    def calls_the_private_method
      the_private_method
    end

    def calls_the_private_method_on_self
      self.the_private_method
    end

    private

    def the_private_method
      :the_private_value
    end
  end

  context 'methods on objects' do
    # This simply means the variable `an_object` will be an instance of `MyClass`
    let(:an_object) { MyClass.new }

    it 'is possible to call methods on objects' do
      expect(an_object.the_method).to eq(__)
    end

    it 'a method on an object can call other methods on that object' do
      expect(an_object.calls_the_method).to eq(__)
    end

    it 'can call a method on self too' do
      expect(an_object.calls_the_method_on_self).to eq(__)
    end

    it 'raises an error when calling a private method' do
      # Fill in the error and part of the message to move on
      expect { an_object.the_private_method }.to raise_error(__, /__/)
    end

    it 'can all a private method on the same object' do
      expect(an_object.calls_the_private_method).to eq(__)
    end
  end
end
