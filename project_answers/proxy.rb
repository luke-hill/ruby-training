# frozen_string_literal: true

class Proxy
  attr_reader :proxy_object

  def initialize(proxy_object)
    @proxy_object = proxy_object
  end

  def method_missing(method, args, &block)

  end

  def respond_to?(method)
    proxy_object.respond_to?(method)
  end
end
