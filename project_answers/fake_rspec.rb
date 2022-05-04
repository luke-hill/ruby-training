# frozen_string_literal: true

class FakeRSpec
  FakeRSpecError = Class.new(StandardError)

  def self.run(_description)
    puts 'Running tests'
    yield
    puts 'Tests finished'
  end
end
