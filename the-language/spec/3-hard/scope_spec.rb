# Notice that we have defined EVERYTHING inside the Scopes module!
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
      # This fails because it assumes the current Scope for our Otter is what?
      expect { Otter.new }.to raise_error(__)
    end

    it 'can reference nested classes using the scope operator (::)' do
      alfie = Jim::Otter.new
      bonnie = Joe::Otter.new
      expect(alfie.identify).to eq(__)
      expect(bonnie.identify).to eq(__)

      expect(alfie.class != bonnie.class).to eq(__)
      expect(Jim::Otter != Joe::Otter).to eq(__)
    end

    class String
    end

    it "assumes the current scope for 'bare' constants" do
      expect(Scopes::String == String).to eq(__)
    end

    it 'creates new constants - our nested string is not identical to other String classes' do
      expect(String == 'HI'.class).to eq(__)
    end

    it 'can use the prefix :: to access top-level classes' do
      expect(::String == 'HI'.class).to eq(__)
    end

    PI = 3.1416

    it 'is common to define a constant with an upper case first letter' do
      expect(PI).to eq(__)
    end

    MyString = ::String

    it 'uses constants as class names' do
      expect(MyString == ::String).to eq(__)
      expect(MyString == 'HI'.class).to eq(__)
    end

    it 'can look up constants explicitly' do
      expect(PI == Scopes.const_get('PI')).to eq(__)
      expect(MyString == Scopes.const_get('MyString')).to eq(__)
    end

    it 'can give you a list of all constants for any class or module' do
      expect(Jim.constants).to eq(__)
      expect(Object.constants.size > __).to be_truthy
    end
  end
end
