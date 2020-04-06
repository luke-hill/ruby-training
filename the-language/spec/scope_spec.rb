# Notice that we have define everything inside the Scopes module
module Scopes
  RSpec.describe "scope" do
    module Jims
      class Dog
        def identify
          :jims_dog
        end
      end
    end

    module Joes
      class Dog
        def identify
          :joes_dog
        end
      end
    end

    it "cannot access Dog in the current scope" do
      expect {
        Dog.new
      }.to raise_error( __ )
    end

    it "can reference nested classes using the scope operator" do
      fido = Jims::Dog.new
      rover = Joes::Dog.new
      expect( fido.identify ).to eq( __ )
      expect( rover.identify ).to eq( __ )

      expect( fido.class != rover.class ).to eq( __ )
      expect( Jims::Dog != Joes::Dog ).to eq( __ )
    end

    class String
    end

    it "assumes the current scope for 'bare' constants" do
      expect( Scopes::String == String ).to eq( __ )
    end

    it "creates new constants - our nested string is not the same as they system String" do
      expect( String == "HI".class ).to eq( __ )
    end

    it "can use the prefix :: to access top-level classes" do
      expect( ::String == "HI".class ).to eq( __ )
    end

    PI = 3.1416

    it "defines constants with an upper case first letter" do
      expect( PI ).to eq( __ )
    end

    MyString = ::String

    it "uses constants as class names" do
      expect( MyString == ::String ).to eq( __ )
      expect( MyString == "HI".class ).to eq( __ )
    end

    it "can look up constants explicitly" do
      expect( PI == Scopes.const_get("PI") ).to eq( __ )
      expect( MyString == Scopes.const_get("MyString") ).to eq( __ )
    end

    it "can give you a list of all constants for any class or module" do
      expect( Jims.constants ).to eq( __ )
      expect( Object.constants.size > __ ).to be_truthy
    end
  end
end
