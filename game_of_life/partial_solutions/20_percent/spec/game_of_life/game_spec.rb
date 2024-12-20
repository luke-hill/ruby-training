# frozen_string_literal: true

RSpec.describe GameOfLife::Game do
  subject(:game) { described_class.new }

  it 'has an initial state containing cells' do
    expect(game.cells).to be_an Array
  end

  it 'contains a series of GameOfLife::Cells' do
    expect(game.cells.first).to all be_a GameOfLife::Cell
  end
end
