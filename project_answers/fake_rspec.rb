# frozen_string_literal: true

require 'rainbow'
require 'rainbow/refinement'
using Rainbow

class FakeRSpec
  FakeRSpecError = Class.new(StandardError)

  class << self
    attr_accessor :results

    def run(description)
      puts "Running #{description} tests".yellow
      self.results = []
      yield
      puts 'All Tests finished'.yellow
      puts "Result-set: #{results}"
    end

    def it(description)
      puts "Running test: #{description}".blue
      yield.tap do |result|
        if result
          puts "#{description}: Congratulations the test passed".green.underline
        else
          puts "#{description}: TEST FAILED!".red.italic.bold
        end
        results << result
      end
    end
  end
end

def self.it(*args, &block)
  FakeRSpec.it(*args, &block)
end
