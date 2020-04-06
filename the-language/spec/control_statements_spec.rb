RSpec.describe "Control statements in ruby" do

  it "has if-else statements" do
    if true
      result = :true_value
    else
      result = :false_value
    end
    expect( result ).to eq( __ )
  end

  it "has if then statements" do
    result = :default_value
    if true
      result = :true_value
    end
    expect( result ).to eq( __ )
  end

  it "returns a value from an if statement" do
    value = if true
              :true_value
            else
              :false_value
            end
    expect( value ).to eq( __ )

    value = if false
              :true_value
            else
              :false_value
            end
    expect( value ).to eq( __ )

    # NOTE: Actually, EVERY statement in Ruby will return a value, not
    # just if statements.
  end

  it "even returns a value when the if fails, and there's no else" do
    value = if false
              :true_value
            end
    expect( value ).to eq( __ )
  end

  it "has a condition (ternary) operator" do
    expect(
      true ? :true_value : :false_value
    ).to eq( __ )

    expect(
      false ? :true_value : :false_value
    ).to eq( __ )
  end

  it "can use an if as a statement modifier" do
    result = :default_value
    result = :true_value if true

    expect( result ).to eq( __ )
  end

  it "has an unless statement" do
    result = :default_value
    unless false    # same as saying 'if !false', which evaluates as 'if true'
      result = :false_value
    end
    expect( result ).to eq( __ )

    result = :default_value
    unless true    # same as saying 'if !true', which evaluates as 'if false'
      result = :true_value
    end
    expect( result ).to eq( __ )
  end

  it "can use unless as a statement modifier" do
    result = :default_value
    result = :false_value unless false

    expect( result ).to eq( __ )
  end

  it "has a while statment" do
    i = 1
    result = 1
    while i <= 10
      result = result * i
      i += 1
    end
    expect( result ).to eq( __ )
  end

  it "has a break statement" do
    i = 1
    result = 1
    while true
      break unless i <= 10
      result = result * i
      i += 1
    end
    expect( result ).to eq( __ )
  end

  it "can return a value with break" do
    i = 1
    result = while i <= 10
      break i if i % 2 == 0
      i += 1
    end

    expect( result ).to eq( __ )
  end

  it "can skip on using next" do
    i = 0
    result = []
    while i < 10
      i += 1
      next if (i % 2) == 0
      result << i
    end
    expect( result ).to eq( __ )
  end

  it "has a for statement" do
    array = ["fish", "and", "chips"]
    result = []
    for item in array
      result << item.upcase
    end
    expect( result ).to eq( [__, __, __] )
  end

  it "has a times statement" do
    sum = 0
    10.times do
      sum += 1
    end
    expect( sum ).to eq( __ )
  end

end
