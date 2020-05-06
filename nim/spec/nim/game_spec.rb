# frozen_string_literal: true

RSpec.describe Nim::Game do
  it 'is a Game a wrapped object' do
    expect(subject).to be_a(Nim::Game)
  end
end
