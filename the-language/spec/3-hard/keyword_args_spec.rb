RSpec.describe "ruby's keyword args" do
  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  it 'is possible to define a method with keyword arguments' do
    expect(method_with_keyword_arguments.class).to eq(__)
    expect(method_with_keyword_arguments).to eq(__)
    expect(method_with_keyword_arguments(one: 'one')).to eq(__)
    expect(method_with_keyword_arguments(two: 2)).to eq(__)
  end

  def method_with_keyword_arguments_including_mandatory(one, two: 2, three: 3)
    [one, two, three]
  end

  it 'is possible to define a method with regular and keyword arguments' do
    expect { method_with_keyword_arguments_including_mandatory }
      .to raise_error(__, /__/)
  end
end
