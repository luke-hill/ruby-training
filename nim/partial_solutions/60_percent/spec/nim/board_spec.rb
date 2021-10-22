# frozen_string_literal: true

require 'nim/board'

RSpec.describe Nim::Board do
  let(:board) { described_class.new }

  it 'consists of 5 rows' do
    expect(board.rows).to all be_a Nim::Row
  end

  it 'has a prompt at the top, alluding to who should play' do
    expect(board.prompt).to match(/^\w+: it is your turn.$/)
  end
end
