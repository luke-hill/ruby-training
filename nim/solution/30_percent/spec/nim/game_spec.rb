# frozen_string_literal: true

require 'nim/game'

RSpec.describe Nim::Game do
  describe '#start' do
    let(:game) { described_class.new }

    context 'with no players' do
      before do
        allow(game).to receive(:determine_player_name).and_return('')
      end

      it 'fails to create a game' do
        expect { game.start }.to raise_error(GameSetupError)
      end
    end

    context 'with 1 player' do
      before do
        allow(game).to receive(:determine_player_name).and_return('Player1', '')
      end

      it 'fails to create a game' do
        expect { game.start }.to raise_error(GameSetupError)
      end
    end

    context 'with 2 identically named players' do
      before do
        allow(game)
          .to receive(:determine_player_name)
          .and_return('Player1', 'Player1')
      end

      it 'fails to create a game' do
        expect { game.start }.to raise_error(GameSetupError)
      end
    end

    context 'with 2 different players' do
      before do
        allow(game)
          .to receive(:determine_player_name)
          .and_return('Player1', 'Player2')
      end

      it 'creates a game' do
        expect { game.start }.not_to raise_error
      end

      it 'assigns Player 1 as the active player' do
        expect { game.start }.to change(game, :active_player).to(:player_one)
      end

      it 'assigns Player 2 as the inactive player' do
        expect { game.start }.to change(game, :inactive_player).to(:player_two)
      end

      it 'stores the player names' do
        game.start

        expect(game.players).to eq(%w[Player1 Player2])
      end

      it 'creates the starting Board' do
        game.start

        expect(game.board).to be_a(Nim::Board)
      end
    end
  end
end
