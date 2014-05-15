require_relative "movement"

class Piece
  include Movement

  attr_reader :type
  attr_accessor :location

  def initialize(type, location = nil)
    @type = type
    @location = location
  end

  def get_piece_logic #movement_type
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
    all_location_possiblities.flatten!.sort
  end

end

