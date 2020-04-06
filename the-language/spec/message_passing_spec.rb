RSpec.describe "message passing" do

  class MessageCatcher
    def caught?
      true
    end
  end

  it "can call methods directly" do
    mc = MessageCatcher.new

    expect( mc.caught? ).to eq( __ )
  end

  it "can invoke a method with send" do
    mc = MessageCatcher.new

    expect( mc.send(:caught?) ).to eq( __ )
  end

  it "can invoke methods more dynamically" do
    mc = MessageCatcher.new

    expect( mc.send("caught?") ).to eq( __ )
    expect( mc.send("caught" + __) ).to eq( true )    # What do you need to add to the first string?
    expect( mc.send("CAUGHT?".__) ).to eq( true )      # What would you need to do to the string?
  end

  it "can also use __send__" do
    mc = MessageCatcher.new

    expect( mc.__send__(:caught?) ).to eq( __ )

    # THINK ABOUT IT:
    #
    # Why does Ruby provide both send and __send__ ?
  end

  it "can ask an object if it know how to respond" do
    mc = MessageCatcher.new

    expect( mc.respond_to?(:caught?) ).to eq( __ )
    expect( mc.respond_to?(:does_not_exist) ).to eq( __ )
  end

  class MessageCatcher
    def add_a_payload(*args)
      args
    end
  end

  it "can send a message with arguments" do
    mc = MessageCatcher.new

    expect( mc.add_a_payload ).to eq( __ )
    expect( mc.send(:add_a_payload) ).to eq( __ )

    expect( mc.add_a_payload(3, 4, nil, 6) ).to eq( __ )
    expect( mc.send(:add_a_payload, 3, 4, nil, 6) ).to eq( __ )
  end

  # NOTE:
  #
  # Both obj.msg and obj.send(:msg) sends the message named :msg to
  # the object. We use "send" when the name of the message can vary
  # dynamically (e.g. calculated at run time), but by far the most
  # common way of sending a message is just to say: obj.msg.

  class TypicalObject
  end

  it "raises an error if you send undefined messages" do
    typical = TypicalObject.new

    expect { typical.foobar }.to raise_error( __, /__/ )
  end

  it "raises the NoMethodError by calling method_missing" do
    typical = TypicalObject.new

    expect( typical.respond_to?(:method_missing, true) ).to eq( __ )
    expect { typical.send(:method_missing) }.to raise_error( __, /__/ )

    # THINK ABOUT IT:
    #
    # If the method :method_missing causes the NoMethodError, then
    # what would happen if we redefine method_missing?
    #
    # NOTE:
    #
    # The method_missing method is private. We have passed `true` to
    # `#respond_to?` to have it search private methods too, and we've
    # used `send` to enable us to send the message here.
  end

  class AllMessageCatcher
    def method_missing(method_name, *args, &block)
      "Someone called #{method_name} with <#{args.join(", ")}>"
    end
  end

  it "catches any message now" do
    catcher = AllMessageCatcher.new

    expect( catcher.foobar ).to eq( __ )
    expect( catcher.foobaz(1) ).to eq( __ )
    expect( catcher.sum(1,2,3,4,5,6) ).to eq( __ )
  end

  it "now lies when you ask if it respond_to?" do
    catcher = AllMessageCatcher.new

    expect {
      catcher.any_method
    }.not_to raise_error
    expect( catcher.respond_to?(:any_method) ).to eq( __ )
  end

  class WellBehavedFooCatcher
    def method_missing(method_name, *args, &block)
      if method_name.to_s[0,3] == "foo"
        "Foo to you too"
      else
        super(method_name, *args, &block)
      end
    end
  end

  it "catches foo_ methods" do
    catcher = WellBehavedFooCatcher.new

    expect( catcher.foo_bar ).to eq( __ )
    expect( catcher.foo_baz ).to eq( __ )
  end

  it "behaves normally for non-foo methods" do
    catcher = WellBehavedFooCatcher.new

    expect {
      catcher.normal_undefined_method
    }.to raise_error( __ )
  end

  # (note: just reopening class from above)
  class WellBehavedFooCatcher
    def respond_to?(method_name, include_private=false)
      if method_name.to_s[0,3] == "foo"
        true
      else
        super(method_name, include_private)
      end
    end
  end

  it "now tells the truth using an explictly defined #respond_to? method" do
    catcher = WellBehavedFooCatcher.new

    expect( catcher.respond_to?(:foo_bar) ).to eq( __ )
    expect( catcher.respond_to?(:something_else) ).to eq( __ )
  end

end
