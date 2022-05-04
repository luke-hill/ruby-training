# frozen_string_literal: true

class Proxy

  attr_reader :proxy_object

  def initialize(proxy_object)
    @proxy_object = proxy_object
  end
end
