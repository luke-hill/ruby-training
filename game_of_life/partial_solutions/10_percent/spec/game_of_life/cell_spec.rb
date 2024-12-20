# frozen_string_literal: true

RSpec.describe GameOfLife::Cell do
  subject(:cell) { described_class.new }

  it { is_expected.to be_alive }
  it { is_expected.not_to be_dead }
end
