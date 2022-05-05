# frozen_string_literal: true

require_relative '../lib/fake_rspec'

FakeRSpec.run 'hard example' do
  it 'Running Test 1' do
    5 == 3
  end

  it 'Running Test 2' do
    3 == 3
  end

  it 'Running Test 3' do
    'abc'.is_a?(Symbol)
  end

  it 'Running Test 4' do
    123.is_a?(Integer)
  end

  it 'Running Test 5' do
    [1,2,3,4].all?(&:even?)
  end

  it 'Running Test 6' do
    String.is_a?(Class)
  end
end
