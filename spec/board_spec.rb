# frozen_string_literal: true

require './lib/board'

describe Board do
  describe '#initialize' do
    context 'with default height and width' do
      let(:board) { Board.new }
      let(:default_height) { 5 }
      let(:default_width) { 5 }

      it 'should have a default height of 5' do
        expect(board.height).to eq default_height
      end

      it 'should have a default width of 5' do
        expect(board.width).to eq default_width
      end
    end

    context 'with specified height and width' do
      let(:board) { Board.new(height:, width:) }
      let(:height) { 6 }
      let(:width) { 6 }

      it 'should have a height that matches the height param' do
        expect(board.height).to eq height
      end

      it 'should have a width that matches the width param' do
        expect(board.width).to eq width
      end
    end
  end
end
