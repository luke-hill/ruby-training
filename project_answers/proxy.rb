# frozen_string_literal: true

class Proxy
  attr_reader :messages, :proxy_object

  def initialize(proxy_object)
    @messages = []
    @proxy_object = proxy_object
  end

  def method_missing(method, *args, &block)
    messages << method
    proxy_object.send(method, *args, &block)
  end

  def respond_to?(method)
    proxy_object.respond_to?(method) || super(method)
  end

  def called?(proxied_method)
    messages.include?(proxied_method)
  end

  def number_of_times_called(method)
    messages.count(method)
  end
end
