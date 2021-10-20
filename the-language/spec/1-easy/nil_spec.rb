RSpec.describe 'nil in ruby' do
  it 'is an object' do
    expect(nil.is_a?(Object)).to eq(true), 'unlike NULL in some other languages'
  end

  it "doesn't throw null pointer exceptions" do
    # Here we're created a begin - rescue - end block so that we can
    # capture the exception thrown, when we send nil a message that it
    # does not understand.
    begin
      nil.a_method_that_does_not_exist
    rescue NoMethodError => e
      # What sort of exception is thrown
      expect(e.class).to eq(__)

      # What extra information does ruby give us?
      # You can replace __ here with part of the message
      expect(e.message).to match(/__/)
    end
  end

  it 'has a few methods defined on it' do
    expect(nil.nil?).to eq(__)
    expect(nil.to_s).to eq(__)
    expect(nil.inspect).to eq(__)
  end

  context 'rspec matchers' do
    class NilObject
      def nil?
        true
      end
    end

    class NotNilObject
      def nil?
        false
      end
    end

    it 'can match objects to nil directly' do
      expect(__).to be nil
      expect(__).to eq nil
    end

    it 'can match objects that respond to nil?' do
      # Make sure you use the objects above
      expect(__).to be_nil
      expect(__).not_to be_nil
    end
  end
end
