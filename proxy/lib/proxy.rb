# frozen_string_literal: true

class Proxy

  attr_reader :proxy_object

  def initialize(proxy_object)
    @object = proxy_object
    @recorded_messages = []
  end

  def method_missing(method_name, *args, &block)
    if @object.respond_to? method_name
      @recorded_messages.push method_name
      @object.send method_name, *args
    else
      super(method_name, *args, &block)
    end
    end
end
