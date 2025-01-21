# frozen_string_literal: true

RSpec.describe 'Pass by reference vs Pass by value' do
  it 'originally seems as if ruby is pass by value' do
    x = 123
    y = x
    x += 2

    expect(y).to eq(__)
  end

  it 'is possible to pass something which can be seen as pass by reference' do
    # NB: This is essentially a deprecated Koan. It will fail when using frozen string literals
    # This is because we are overwriting and mutating in place
    # See the koan below for another example that won't be deprecated
    x = 'string'
    y = x
    x = x.upcase

    expect { expect(y).to eq('STRING') }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end

  it 'is also possible to mutate a larger standard object and pass by reference' do
    x = [1, 2, 3]
    y = x
    x.map! { |number| number * 2 }

    expect(y).to eq(__)
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
    # NB: This is a "changing" Koan. It will change in output from when we start using frozen string literals
    #
    # This is because we are testing the string itself and seeing whether it is being mutated in place
    # Given this is only mutating it in place on assignment it "shouldn't" be throwing an error on the
    # physical assignment, so it will now "pass by original reference" to the original object
    initial = Initial.new
    other = Other.new
    initial.x = other.value

    expect(initial.x == other.value).to be(__)
    expect { expect(initial.x.object_id == other.value.object_id).to be(__) }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end
end
