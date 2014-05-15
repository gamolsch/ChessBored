require 'pry_debug'

# squares = (1..64).to_a

# class BoardSquare
#   attr_reader :piece, :index

#   def initialize(index)
#     @piece = nil
#     @index = index
#   end

# end

# board = []

# squares.each do | num |
#   board.push BoardSquare.new(num)
# end

# | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8
# | 9  | 10 | 11 | 12 | 13 | 14 | 15 | 16
# | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24
# | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32
# | 33 | 34 | 35 | 36 | 37 | 38 | 39 | 40
# | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48
# | 49 | 50 | 51 | 52 | 53 | 54 | 55 | 56
# | 57 | 58 | 59 | 60 | 61 | 62 | 63 | 64


# class Knight
#   def valid_moves(location_of_knight)
#     array_of_possible = []
#     array_of_possible << location_of_knight + 15
#     array_of_possible << location_of_knight + 17
#     array_of_possible << location_of_knight - 15
#     array_of_possible << location_of_knight - 17
#     array_of_possible << location_of_knight + 6
#     array_of_possible << location_of_knight - 6
#     array_of_possible << location_of_knight + 10
#     array_of_possible << location_of_knight - 10
#     return array_of_possible #need to a method to handle exceptions
#   end
# end

module Movement
#----------------------------------------------------------------------------------------------Rook, Queen
  def get_horizontal_vertical_slide
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
  #-------------------------------------------------------------------------------------- Bishop, Queen
  def get_diagonal_slide
    all_possibilities = []
    all_possibilities << possible_up_right(self.location)
    all_possibilities << possible_up_left(self.location)
    all_possibilities << possible_down_right(self.location)
    all_possibilities << possible_down_left(self.location)
    all_possibilities
  end


  def possible_up_right(location)
    possibilities = []
    possible_up_right = location
    while ( (possible_up_right % 8 != 0) && (possible_up_right <= 64) )
      possible_up_right += 9
      possibilities << possible_up_right if possible_up_right <= 64
    end
    possibilities
  end

  def possible_up_left(location)
    possibilities = []
    possible_up_left = location
    while ( ( (possible_up_left + 7) % 8 != 0) && (possible_up_left <= 64) )
      possible_up_left += 7
      possibilities << possible_up_left if possible_up_left <= 64
    end
    possibilities
  end

  def possible_down_right(location)
    possibilities = []
    possible_down_right = location
    while ( (possible_down_right % 8 != 0) && (possible_down_right >= 1) )
      possible_down_right -= 7
      possibilities << possible_down_right if possible_down_right >= 1
    end
    possibilities
  end

  def possible_down_left(location)
    possibilities = []
    possible_down_left = location
    while ( ( (possible_down_left + 7) % 8 != 0) && (possible_down_left >= 1) )
      possible_down_left -= 9
      possibilities << possible_down_left if possible_down_left >= 1
    end
    possibilities
  end
#--------------------------------------------------------------------------------------------King
  def get_king_step
    all_possibilities = []
    all_possibilities << possible_up_step(self.location)
    all_possibilities << possible_down_step(self.location)
    all_possibilities << possible_right_step(self.location)
    all_possibilities << possible_left_step(self.location)
    all_possibilities << possible_up_right_step(self.location)
    all_possibilities << possible_up_left_step(self.location)
    all_possibilities << possible_down_right_step(self.location)
    all_possibilities << possible_down_left_step(self.location)
    all_possibilities
  end

  def possible_up_step(location)
    possibilities = []
    possible_up = location
    if possible_up <= 64
      possible_up += 8
      possibilities << possible_up if possible_up <= 64
    end
    possibilities
  end

  def possible_down_step(location)
    possibilities = []
    possible_down = location
    if possible_down >= 1
      possible_down -= 8
      possibilities << possible_down if possible_down >= 1
    end
    possibilities
  end

  def possible_right_step(location)
    possibilities = []
    possible_right = location
    if ( (possible_right % 8 != 0) && (possible_right <= 64) )
      possible_right += 1
      possibilities << possible_right if possible_right <= 64
    end
    possibilities
  end

  def possible_left_step(location)
    possibilities = []
    possible_left = location
    if ( ( (possible_left + 7) % 8 != 0) && (possible_left >= 1) )
      possible_left -= 1
      possibilities << possible_left if possible_left >= 1
    end
    possibilities
  end

  def possible_up_right_step(location)
    possibilities = []
    possible_up_right = location
    if ( (possible_up_right % 8 != 0) && (possible_up_right <= 64) )
      possible_up_right += 9
      possibilities << possible_up_right if possible_up_right <= 64
    end
    possibilities
  end

  def possible_up_left_step(location)
    possibilities = []
    possible_up_left = location
    if ( ( (possible_up_left + 7) % 8 != 0) && (possible_up_left <= 64) )
      possible_up_left += 7
      possibilities << possible_up_left if possible_up_left <= 64
    end
    possibilities
  end

  def possible_down_right_step(location)
    possibilities = []
    possible_down_right = location
    if ( (possible_down_right % 8 != 0) && (possible_down_right >= 1) )
      possible_down_right -= 7
      possibilities << possible_down_right if possible_down_right >= 1
    end
    possibilities
  end

  def possible_down_left_step(location)
    possibilities = []
    possible_down_left = location
    if ( ( (possible_down_left + 7) % 8 != 0) && (possible_down_left >= 1) )
      possible_down_left -= 9
      possibilities << possible_down_left if possible_down_left >= 1
    end
    possibilities
  end
end





