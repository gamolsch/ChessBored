# | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8
# | 9  | 10 | 11 | 12 | 13 | 14 | 15 | 16
# | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24
# | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32
# | 33 | 34 | 35 | 36 | 37 | 38 | 39 | 40
# | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48
# | 49 | 50 | 51 | 52 | 53 | 54 | 55 | 56
# | 57 | 58 | 59 | 60 | 61 | 62 | 63 | 64


require 'rspec'

require 'pry'

require_relative "piece.rb"

describe Piece do
  let(:rook) {Piece.new("rook", nil)}

  context "#valid_moves" do
    it "Rook can move correctly" do
      rook.location = 22
      expect(rook.get_piece_logic).to eq [6, 14, 17, 18, 19, 20, 21, 23, 24, 30, 38, 46, 54, 62]
    end

    it "Rook moves correctly when at top right corner" do
      rook.location = 8
      expect(rook.get_piece_logic).to eq [1, 2, 3, 4, 5, 6, 7, 16, 24, 32, 40, 48, 56, 64]
    end

    it "Rook moves correctly when at top left corner" do
      rook.location = 1
      expect(rook.get_piece_logic).to eq [2, 3, 4, 5, 6, 7, 8, 9, 17, 25, 33, 41, 49, 57]
    end

    it "Rook moves correctly when at bottom right corner" do
      rook.location = 64
      expect(rook.get_piece_logic).to eq [8, 16, 24, 32, 40, 48, 56, 57, 58, 59, 60, 61, 62, 63]
    end

    it "Rook moves correctly when at bottom left corner" do
      rook.location = 57
      expect(rook.get_piece_logic).to eq [1, 9, 17, 25, 33, 41, 49, 58, 59, 60, 61, 62, 63, 64]
    end

  end
end

describe Piece do
  let(:bishop) {Piece.new("bishop", nil)}

  context "#valid_moves" do
    it "Bishop can move correctly" do
      bishop.location = 22
      expect(bishop.get_piece_logic).to eq [4, 8, 13, 15, 29, 31, 36, 40, 43, 50, 57]
    end

    it "Bishop can't go beyond bottom of board" do
      bishop.location = 61
      expect(bishop.get_piece_logic).to eq [25, 34, 40, 43, 47, 52, 54]
    end

    it "Bishop can't go beyond top-right of board" do
      bishop.location = 8
      expect(bishop.get_piece_logic).to eq [15, 22, 29, 36, 43, 50, 57]
    end

    it "Bishop can't go beyond top-left of board" do
      bishop.location = 1
      expect(bishop.get_piece_logic).to eq [10, 19, 28, 37, 46, 55, 64]
    end

    it "Bishop can't go beyond bottom-left of board" do
      bishop.location = 57
      expect(bishop.get_piece_logic).to eq [8, 15, 22, 29, 36, 43, 50]
    end

    it "Bishop can't go beyond bottom-right of board" do
      bishop.location = 64
      expect(bishop.get_piece_logic).to eq [1, 10, 19, 28, 37, 46, 55]
    end
  end
end

describe Piece do
  let(:queen) {Piece.new("queen", nil)}

  context "#valid_moves" do
    it "Queen can move correctly" do
      queen.location = 22
      expect(queen.get_piece_logic).to eq [4, 6, 8, 13, 14, 15, 17, 18, 19, 20, 21, 23, 24, 29, 30, 31, 36, 38, 40, 43, 46, 50, 54, 57, 62]
    end

    it "Queen moves correctly when at top right corner" do
      queen.location = 8
      expect(queen.get_piece_logic).to eq [1, 2, 3, 4, 5, 6, 7, 15, 16, 22, 24, 29, 32, 36, 40, 43, 48, 50, 56, 57, 64]
    end

    it "Queen moves correctly when at top left corner" do
      queen.location = 1
      expect(queen.get_piece_logic).to eq [2, 3, 4, 5, 6, 7, 8, 9, 10, 17, 19, 25, 28, 33, 37, 41, 46, 49, 55, 57, 64]
    end

    it "Queen moves correctly when at bottom right corner" do
      queen.location = 64
      expect(queen.get_piece_logic).to eq [1, 8, 10, 16, 19, 24, 28, 32, 37, 40, 46, 48, 55, 56, 57, 58, 59, 60, 61, 62, 63]
    end

    it "Queen moves correctly when at bottom left corner" do
      queen.location = 57
      expect(queen.get_piece_logic).to eq [1, 8, 9, 15, 17, 22, 25, 29, 33, 36, 41, 43, 49, 50, 58, 59, 60, 61, 62, 63, 64]
    end

  end
end

describe Piece do
  let(:king) {Piece.new("king", nil)}

  context "#valid_moves" do
    it "King can move correctly" do
      king.location = 43
      expect(king.get_piece_logic).to eq [34, 35, 36, 42, 44, 50, 51, 52]
    end

    it "King moves correctly when at top right corner" do
      king.location = 8
      expect(king.get_piece_logic).to eq [7, 15, 16]
    end

    it "King moves correctly when at top left corner" do
      king.location = 1
      expect(king.get_piece_logic).to eq [2, 9, 10]
    end

    it "King moves correctly when at bottom right corner" do
      king.location = 64
      expect(king.get_piece_logic).to eq [55, 56, 63]
    end

    it "King moves correctly when at bottom left corner" do
      king.location = 57
      expect(king.get_piece_logic).to eq [49, 50, 58]
    end

  end
end




