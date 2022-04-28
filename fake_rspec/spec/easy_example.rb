# frozen_string_literal: true

require_relative '../lib/fake_rspec'

FakeRSpec.run 'easy example' do
  # Test 1
  5 == 3

  # Test 2
  3 == 3

  # Test 3
  'abc'.is_a?(Symbol)

  # Test 4
  123.is_a?(Integer)

  # Test 5
  [1,2,3,4].all?(&:even?)

  # Test 6
  String.is_a?(Class)
end
