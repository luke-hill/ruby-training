# Notice that we have define everything inside a Scopes module
module Scopes
  RSpec.describe 'scopes' do
    module Jim
      class Otter
        def identify
          :jims_otter
        end
      end
    end

    module Joe
      class Otter
        def identify
          :joes_otter
        end
      end
    end

    it 'cannot access Otter in the current scope' do

      # This fails because it assumes a Current Scope for our Otter which is what?
      expect { Otter.new }.to raise_error(StandardError)
    end

    it 'can reference nested classes using the scope operator (::)' do
      alfie = Jim::Otter.new
      bonnie = Joe::Otter.new
      expect(alfie.identify).to eq(:jims_otter)
      expect(bonnie.identify).to eq(:joes_otter)

      expect(alfie.class != bonnie.class).to eq(true)
      expect(Jim::Otter != Joe::Otter).to eq(true)
    end

    class String
    end

    it "assumes the current scope for 'bare' constants" do
      expect(Scopes::String == String).to eq(true)
    end

    it 'creates new constants - our nested string is not identical to other' do
      expect(String == 'HI'.class).to eq(false)
    end

    it 'can use the prefix :: to access top-level classes' do
      expect(::String == 'HI'.class).to eq(true)
    end

    PI = 3.1416

    it 'defines constants with an upper case first letter' do
      expect(PI).to eq(3.1416)
    end

    MyString = ::String

    it 'uses constants as class names' do
      expect(MyString == ::String).to eq(true)
      expect(MyString == 'HI'.class).to eq(true)
    end

    it 'can look up constants explicitly' do
      expect(PI == Scopes.const_get('PI')).to eq(true)
      expect(MyString == Scopes.const_get('MyString')).to eq(true)
    end

    it 'can give you a list of all constants for any class or module' do
      expect(Jim.constants).to eq([:Otter])
      expect(Object.constants.size > 1).to be_truthy
    end
  end
end
