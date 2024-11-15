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
      output_test_run_information
    end

    def it(description)
      puts "Running test: #{description}".blue
      yield.tap do |result|
        if result
          puts "#{description}: Congratulations the test passed".green
        else
          puts "#{description}: TEST FAILED!".red.italic.bold
        end
        results << result
      end
    end

    def output_test_run_information
      puts 'All Tests finished'.yellow
      puts "Result-set: #{results}"
      puts "Passing tests: #{results.count(true)}".green.underline
      puts "Failing tests: #{results.count(false)}".red.underline
    end
  end
end

def self.it(*args, &block)
  FakeRSpec.it(*args, &block)
end
