RSpec.describe "exceptions" do

  class MySpecialError < RuntimeError
  end

  it "inherits from Exception" do
    expect( MySpecialError.ancestors[1] ).to eq( __ )
    expect( MySpecialError.ancestors[2] ).to eq( __ )
    expect( MySpecialError.ancestors[3] ).to eq( __ )
    expect( MySpecialError.ancestors[4] ).to eq( __ )
  end

  it "is possible to `rescue` an exception" do
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    expect( result ).to eq( __ )

    expect( ex.is_a?(StandardError) ).to eq( __ ), "Should be a Standard Error"
    expect( ex.is_a?(RuntimeError) ).to eq( __ ),  "Should be a Runtime Error"

    expect( RuntimeError.ancestors.include?(StandardError) ).to be(true),
      "RuntimeError is a subclass of StandardError"

    expect( ex.message ).to eq( __ )
  end

  it "can raise a specific error" do
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = :exception_handled
    end

    expect( result ).to eq( __ )
    expect( ex.message ).to eq( __ )
  end

  it "can `ensure` code is always run" do
    result = nil
    begin
      fail "Oops"
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    expect( result ).to eq( __ )
  end

  it "can raise a new instance of an error" do
    # A do-end is a block, which we'll come back to
    expect do
      raise MySpecialError.new("New instances can be raised directly.")
    end.to raise_error(__)
  end

end
