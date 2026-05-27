# frozen_string_literal: true

RSpec.describe 'Pass by reference vs Pass by value' do
  it 'originally seems as if ruby is pass by value' do
    x = 123
    y = x
    x += 2

    expect(y).to eq(__)
  end

  it 'is possible to mutate a larger standard object to pass by reference' do
    x = [1, 2, 3]
    y = x
    x.map! { |number| number * 2 }

    expect(y).to eq(__)
  end

  class Primary
    attr_accessor :value
  end

  class Secondary
    def value
      'abc'
    end
  end

  it 'is more complicated when passing objects that could be getting re-assigned' do
    # The objects being used here are not mutated in place. They are only "set" initially
    # They only mutate it in place on "initial" assignment, so it will now "pass by original reference"
    primary = Primary.new
    secondary = Secondary.new
    primary.value = secondary.value

    expect(primary.value == secondary.value).to be(__)
    expect(primary.value.object_id == secondary.value.object_id).to be(__)
  end
end
