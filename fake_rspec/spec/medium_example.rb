# frozen_string_literal: true

require_relative '../lib/fake_rspec'

FakeRSpec.run 'medium example' do
  puts 'Running Test 1'
  p 5 == 3

  puts 'Running Test 2'
  p 3 == 3

  puts 'Running Test 3'
  p 'abc'.is_a?(Symbol)

  puts 'Running Test 4'
  p 123.is_a?(Integer)

  puts 'Running Test 5'
  p [1,2,3,4].all?(&:even?)

  puts 'Running Test 6'
  p String.is_a?(Class)
end
