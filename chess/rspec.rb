require 'rspec'

require 'pry'

require_relative "boardtest"

describe Rook do
  let(:rook) {Rook.new}

  context "#valid_moves" do
    it "Rook can move correctly" do
      expect(rook.valid_moves(22)).to eq [6, 14, 17, 18, 19, 20, 21, 23, 24, 30, 38, 46, 54, 62]
    end

    it "Rook moves correctly when at bottom right corner" do
      expect(rook.valid_moves(8)).to eq [1, 2, 3, 4, 5, 6, 7, 16, 24, 32, 40, 48, 56, 64]
    end

    it "Rook moves correctly when at bottom left corner" do
      expect(rook.valid_moves(1)).to eq [2, 3, 4, 5, 6, 7, 8, 9, 17, 25, 33, 41, 49, 57]
    end

    it "Rook moves correctly when at top right corner" do
      expect(rook.valid_moves(64)).to eq [8, 16, 24, 32, 40, 48, 56, 57, 58, 59, 60, 61, 62, 63]
    end

    it "Rook moves correctly when at top left corner" do
      expect(rook.valid_moves(57)).to eq [1, 9, 17, 25, 33, 41, 49, 58, 59, 60, 61, 62, 63, 64]
    end

  end
end

describe Bishop do
  let(:bishop) {Bishop.new}

  context "#valid_moves" do
    it "Bishop can move correctly" do
      expect(bishop.valid_moves(22)).to eq [4, 8, 13, 15, 29, 31, 36, 40, 43, 50, 57]
    end

    it "Bishop can't go beyond bottom of board" do
      expect(bishop.valid_moves(5)).to eq [12, 14, 19, 23, 26, 32, 33]
    end

    it "Bishop can't go beyond bottom-right of board" do
      expect(bishop.valid_moves(8)).to eq [15, 22, 29, 36, 43, 50, 57]
    end

    it "Bishop can't go beyond bottom-left of board" do
      expect(bishop.valid_moves(1)).to eq [10, 19, 28, 37, 46, 55, 64]
    end

    it "Bishop can't go beyond top-left of board" do
      expect(bishop.valid_moves(57)).to eq [8, 15, 22, 29, 36, 43, 50]
    end

    it "Bishop can't go beyond top-right of board" do
      expect(bishop.valid_moves(64)).to eq [1, 10, 19, 28, 37, 46, 55]
    end
  end
end




