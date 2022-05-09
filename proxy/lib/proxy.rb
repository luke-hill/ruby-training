# frozen_string_literal: true

class Proxy

  attr_reader :proxy_object

  def initialize(proxy_object)
    @object = proxy_object
    @recorded_messages = []
  end

  def method_missing(method_name, *args, &block)
    if @object.respond_to? method_name
      @recorded_messages << method_name
      @object.send method_name, *args
    else
      super(method_name, *args, &block)
    end
  end

  def number_of_times_called(method_name)
    @recorded_messages.count method_name
  end
end
