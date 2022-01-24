RSpec.describe 'keyword args' do
  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  it 'is possible to define a method with keyword arguments (And therefore not need to provide the defaults for others)' do
    expect(method_with_keyword_arguments.class).to eq(__)
    expect(method_with_keyword_arguments).to eq(__)
    expect(method_with_keyword_arguments(one: 'one')).to eq(__)
    expect(method_with_keyword_arguments(two: 2)).to eq(__)

    # THINK ABOUT IT
    # Why do we want to use keyword arguments in ruby often? Think about methods that may have 3/4/5 inputs
  end

  def method_with_keyword_arguments_and_regular_arguments(one, two: 2, three: 3)
    [one, two, three]
  end

  it 'is possible to define a method with regular and keyword arguments' do
    expect { method_with_keyword_arguments_and_regular_arguments }.to raise_error(__, /__/)
  end
end
