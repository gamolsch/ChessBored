class Game < ActiveRecord::Base
  has_many :playersgames
  has_many :players, through: :playersgames
  has_many :pieces, moves:
  belongs_to :group
end
