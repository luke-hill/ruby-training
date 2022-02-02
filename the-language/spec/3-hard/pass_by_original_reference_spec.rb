RSpec.describe 'pass by reference vs pass by value' do
  it 'originally seems as if ruby is pass by value' do
    x = 123
    y = x
    x += 2

    expect(y).to eq(123)
  end

  it 'is possible to pass something which can be seen as pass by reference' do
    x = 'string'
    y = x
    x.upcase!

    expect(y).to eq("STRING")
  end

  it 'is also possible to mutate a larger standard object and pass by reference' do
    x = [1, 2, 3]
    y = x
    x.map! { |number| number * 2 }

    expect(y).to eq([2, 4, 6])
  end

  class Initial
    attr_accessor :x
  end

  class Other
    def value
      'abc'
    end
  end

  it 'gets more complicated when passing objects that could be getting re-assigned' do
    initial = Initial.new
    other = Other.new
    initial.x = other.value

    expect(initial.x == other.value).to be(true)
    expect(initial.x.object_id == other.value.object_id).to be(false)
  end
end
