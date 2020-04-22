# frozen_string_literal: true

RSpec.describe 'nil in Ruby' do
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
      expect(e.class).to eq(NoMethodError)

      # What extra information does ruby give us?
      # You can replace __ here with part of the message
    #  expect(e.message).to match(/"undefined method `a_method_that_does_not_exist' for nil:NilClass"/)
    end
  end

  it 'has a few methods defined on it' do
    expect(nil.nil?).to eq(true)
    expect(nil.to_s).to eq('')
    expect(nil.inspect).to eq('nil')
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
      expect(nil).to be nil
      expect(nil).to eq nil
    end

    it 'can match objects that respond to nil?' do
      # Make sure you use the objects above
      expect(nil).to be_nil
      expect(true).not_to be_nil # false is fine too
    end
  end
end
