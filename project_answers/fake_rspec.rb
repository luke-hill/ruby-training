# frozen_string_literal: true

class FakeRSpec
  FakeRSpecError = Class.new(StandardError)

  def self.run(_description)
    puts 'Running tests'
    yield
    puts 'Tests finished'
  end

  def self.it(description)
    puts "Running test #{description}"
    yield
    puts "Test finished"
  end
end

def self.it(*args, &block)
  FakeRSpec.it(*args, &block)
end
