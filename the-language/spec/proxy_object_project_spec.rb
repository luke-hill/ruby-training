# Project: Create a Proxy Class
#
# In this assignment, create a proxy class (one is started for you
# below).  You should be able to initialize the proxy object with any
# object.  Any messages sent to the proxy object should be forwarded
# to the target object.  As each message is sent, the proxy should
# record the name of the method sent.
#
# The proxy class is started for you.  You will need to add a method
# missing handler and any other supporting methods.

class Proxy
  def initialize(target_object)
    @object = target_object
    # ADD MORE CODE HERE
  end
  # WRITE CODE HERE
end

RSpec.describe "the proxy object" do
  it "returns a wrapped object" do
    # NOTE: The Television class is defined below
    tv = Proxy.new(Television.new)

    # HINT: Proxy class is defined above, may need tweaking...

    expect( tv ).to be_a( Proxy )
  end

  it "still operates the TV as expected" do
    tv = Proxy.new(Television.new)

    tv.channel = 10
    tv.power

    expect( tv.channel ).to eq( 10 )
    expect( tv ).to be_on
  end

  it "records messages sent to the tv" do
    tv = Proxy.new(Television.new)

    tv.power
    tv.channel = 10

    expect( [:power, :channel=] ).to eq( tv.messages )
  end

  it "handles invalid messages" do
    tv = Proxy.new(Television.new)

    expect {
      tv.no_such_method
    }.to raise_error(NoMethodError)
  end

  it "reports proxy methods have been called" do
    tv = Proxy.new(Television.new)

    tv.power
    tv.power

    expect( tv.called?(:power) ).to be_truthy
    expect( tv.called?(:channel) ).to be_falsey
  end

  it "counts method calls" do
    tv = Proxy.new(Television.new)

    tv.power
    tv.channel = 48
    tv.power

    expect( tv.number_of_times_called(:power) ).to eq( 2 )
    expect( tv.number_of_times_called(:channel=) ).to eq( 1 )
    expect( tv.number_of_times_called(:on?) ).to eq( 0 )
  end

  it "proxies any object" do
    proxy = Proxy.new("Code Mash 2009")

    proxy.upcase!
    result = proxy.split

    expect( result ).to eq( ["CODE", "MASH", "2009"] )
    expect( proxy.messages ).to eq( [:upcase!, :split] )
  end
end


# ====================================================================
# The following code is to support the testing of the Proxy class.  No
# changes should be necessary to anything below this comment.

# Example class using in the proxy testing above.
class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end

# Tests for the Television class.  All of theses tests should pass.
RSpec.describe "a television" do
  it "turns on" do
    tv = Television.new

    tv.power
    expect( tv ).to be_on
  end

  it "also turns off" do
    tv = Television.new

    tv.power
    tv.power

    expect( tv ).not_to be_on
  end

  it "turns back on and off" do
    tv = Television.new

    tv.power
    tv.power
    tv.power

    expect( tv ).to be_on

    tv.power

    expect( tv ).not_to be_on
  end

  it "can set a channel" do
    tv = Television.new

    tv.channel = 11
    expect( tv.channel ).to eq( 11 )
  end
end

