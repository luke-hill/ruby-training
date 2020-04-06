gem 'rspec'

require 'rspec/autorun'

class Working < Struct.new(:answer)
end

RSpec.describe "is it working?" do
  it "works" do
    expect( Working.new(42).answer ).to eq( 42 )
  end
end
