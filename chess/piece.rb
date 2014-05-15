require_relative "movement"

class Piece
  include Movement

  attr_reader :type
  attr_accessor :location, :first_move, :color

  def initialize(type, location = nil)
    @type = type
    @location = location
    @color = nil
    @first_move = true
  end

  def get_piece_logic
    all_location_possiblities = []
    if self.type == "rook" || self.type == "queen"
      all_location_possiblities << get_horizontal_vertical_slide
    end
    if self.type == "bishop" || self.type == "queen"
      all_location_possiblities << get_diagonal_slide
    end
    if self.type == "king"
      all_location_possiblities << get_king_step
    end
    if self.type == "knight"
      all_location_possiblities << get_knight_hop
    end
    if self.type == "pawn"
      all_location_possiblities << get_pawn_step
    end
    self.first_move = false
    all_location_possiblities.flatten!.sort
  end

end

