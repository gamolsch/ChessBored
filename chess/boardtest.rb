# require 'rspec'
require 'pry_debug'

squares = (1..64).to_a

class BoardSquare
  attr_reader :piece, :index

  def initialize(index)
    @piece = nil
    @index = index
  end

end

board = []

squares.each do | num |
  board.push BoardSquare.new(num)
end

board.each do |square|
  print "| #{square.index.to_s.ljust(2)} "
  puts if square.index % 8 == 0
end

class Knight
  def valid_moves(location_of_knight)
    array_of_possible = []
    array_of_possible << location_of_knight + 15
    array_of_possible << location_of_knight + 17
    array_of_possible << location_of_knight - 15
    array_of_possible << location_of_knight - 17
    array_of_possible << location_of_knight + 6
    array_of_possible << location_of_knight - 6
    array_of_possible << location_of_knight + 10
    array_of_possible << location_of_knight - 10
    return array_of_possible #need to a method to handle exceptions
  end
end

module Movement

  def get_horizontal_vertical_slide
    all_possibilities = []
    all_possibilities << possible_up(self.location)
    all_possibilities << possible_down(self.location)
    all_possibilities << possible_right(self.location)
    all_possibilities << possible_left(self.location)
    all_possibilities
  end

  def get_diagonal_slide
    all_possibilities = []
    all_possibilities << possible_up(self.location)
    all_possibilities << possible_down(self.location)
    all_possibilities << possible_right(self.location)
    all_possibilities << possible_left(self.location)
    all_possibilities
  end

  def possible_up(location)
    possibilities = []
    possible_up = location
    while (possible_up <= 64)
      possible_up += 8
      possibilities << possible_up if possible_up <= 64
    end
    possibilities
  end

  def possible_down(location)
    possibilities = []
    possible_down = location
    while (possible_down >= 1)
      possible_down -= 8
      possibilities << possible_down if possible_down >= 1
    end
    possibilities
  end

  def possible_right(location)
    possibilities = []
    possible_right = location
    while  ( (possible_right % 8 != 0) && (possible_right <= 64) )
      possible_right += 1
      possibilities << possible_right if possible_right <= 64
    end
    possibilities
  end

  def possible_left(location)
    possibilities = []
    possible_left = location
    while  ( ( (possible_left + 7) % 8 != 0) && (possible_left >= 1) )
      possible_left -= 1
      possibilities << possible_left if possible_left >= 1
    end
    possibilities
  end

end

#when we put this in our Piece Model...
#"valid_moves" will

class Rook
  include Movement

  def valid_moves(location)
    array_of_possible = []
    array_of_possible << Movement.possible_up(location)
    array_of_possible << Movement.possible_down(location)
    array_of_possible << Movement.possible_left(location)
    array_of_possible << Movement.possible_right(location)
    array_of_possible.flatten!.sort!
    # return array_of_possible
  end
  # def valid_moves(location) #all passing

  #   array_of_possible = []
  #   possible_up = location
  #   while (possible_up <= 64)
  #     possible_up += 8
  #     array_of_possible << possible_up if possible_up <= 64
  #   end

  #   possible_down = location
  #   while (possible_down >= 1)
  #     possible_down -= 8
  #     array_of_possible << possible_down if possible_down >= 1
  #   end

  #   possible_right = location
  #   while  ( (possible_right % 8 != 0) && (possible_right <= 64) )
  #     possible_right += 1
  #     array_of_possible << possible_right if possible_right <= 64
  #   end

  #   possible_left = location
  #   while  ( ( (possible_left + 7) % 8 != 0) && (possible_left >= 1) )
  #     possible_left -= 1
  #     array_of_possible << possible_left if possible_left >= 1
  #   end

  #   array_of_possible.sort
  # end
end

class Bishop
  def valid_moves(location)
    array_of_possible = []

    possible_up_right = location
    while ( (possible_up_right % 8 != 0) && (possible_up_right <= 64) )
      possible_up_right += 9
      array_of_possible << possible_up_right if possible_up_right <= 64
    end

    possible_up_left = location
    while ( ( (possible_up_left + 7) % 8 != 0) && (possible_up_left <= 64) )
      possible_up_left += 7
      array_of_possible << possible_up_left if possible_up_left <= 64
    end

    possible_down_right = location
    while ( (possible_down_right % 8 != 0) && (possible_down_right >= 1) )
      possible_down_right -= 7
      array_of_possible << possible_down_right if possible_down_right >= 1
    end

    possible_down_left = location
    while ( ( (possible_down_left + 7) % 8 != 0) && (possible_down_left >= 1) )
      possible_down_left -= 9
      array_of_possible << possible_down_left if possible_down_left >= 1
    end

    array_of_possible.sort
  end
end



  #p test_knight(28)

#p test_rook()

#pawn (pawn able to do two jumps at first, only diagonally kills )
#rook
#bishop
#queen
#king






