# frozen_string_literal: true

require 'rainbow'

class FakeRSpec
  FakeRSpecError = Class.new(StandardError)

  class << self
    attr_accessor :results

    def run(description)
      puts "Running #{description} tests"
      self.results = []
      yield
      puts 'All Tests finished'
      puts "Result-set: #{results}"
    end

    def it(description)
      puts "Running test #{description}"
      yield.tap do |result|
        puts "Result: #{result}"
        results << result
      end
      puts "Test finished"
    end
  end
end

def self.it(*args, &block)
  FakeRSpec.it(*args, &block)
end
