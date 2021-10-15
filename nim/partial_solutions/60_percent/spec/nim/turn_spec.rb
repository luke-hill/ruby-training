# frozen_string_literal: true

require 'nim/turn'

RSpec.describe Nim::Turn do
  describe '#perform' do
    let(:board) { Nim::Board.new }
    let(:active_player) { 'Player One Name' }
    let(:inactive_player) { 'Player Two Name' }
    let(:state) { described_class.new(active_player, inactive_player, board) }

    context 'a valid turn' do
      before do
        allow(state).to receive(:row).and_return(1)
        allow(state).to receive(:amount).and_return(1)
      end

      it 'changes the active player to be inactive' do
        expect { state.perform }.to change(state, :active_player).to(inactive_player)
      end

      it 'changes the inactive player to be active' do
        expect { state.perform }.to change(state, :inactive_player).to(active_player)
      end

      it 'reduces the value of the row by the inputted amount' do
        expect { state.perform }.to change { board.rows[0].value }
      end
    end
  end
end
