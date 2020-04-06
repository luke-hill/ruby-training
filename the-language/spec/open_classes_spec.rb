RSpec.describe "Open Classes" do
  class Dog
    def bark
      "WOOF"
    end
  end

  it "barks as defined" do
    fido = Dog.new
    expect( fido.bark ).to eq( __ )
  end

  # Open the existing Dog class and add a new method.
  class Dog
    def wag
      "HAPPY"
    end
  end

  it "can now wag too" do
    fido = Dog.new
    expect( fido.wag ).to eq( __ )
    expect( fido.bark ).to eq( __ )
  end

  class Integer
    def even_number?
      (self % 2) == 0
    end
  end

  it "is possible to reopen a built in class" do
    expect( 1.even_number? ).to eq( __ )
    expect( 2.even_number? ).to eq( __ )
  end

end
