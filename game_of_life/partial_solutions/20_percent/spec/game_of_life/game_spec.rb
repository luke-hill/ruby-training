# frozen_string_literal: true

RSpec.describe GameOfLife::Game do
  subject(:game) { described_class.new }

  it 'has an initial state containing cells' do
    expect(game.cells).to be_an Array
  end
end
