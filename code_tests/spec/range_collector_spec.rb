# frozen_string_literal: true

require 'range_collector'

RSpec.describe RangeCollector do
  let(:ranges) { subject }

  it 'leaves non-consecutive numbers intact' do
    expect(ranges.play([1, 3, 5])).to eq([1, 3, 5])
  end

  it 'collapses consecutive numbers to a range' do
    expect(ranges.play([1, 2, 3])).to eq(['1-3'])
  end

  it 'plays fizzbuzz to 15 with fizz, buzz rules and fizzbuzz rules' do
    expect(ranges.play([1, 2, 3, 5, 6, 7, 24, 49, 100, 101])).to eq(['1-3', '5-7', 24, 49, '100-101'])
  end
end
