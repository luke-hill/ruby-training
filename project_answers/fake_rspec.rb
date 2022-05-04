# frozen_string_literal: true

class FakeRSpec
  FakeRSpecError = Class.new(StandardError)

  def self.run(_description)
    puts 'Running entire suite of tests'
    yield
    puts 'All Tests finished'
  end

  def self.it(description)
    puts "Running test #{description}"
    result = yield
    puts "Result: #{result}"
    puts "Test finished"
  end
end

def self.it(*args, &block)
  FakeRSpec.it(*args, &block)
end
