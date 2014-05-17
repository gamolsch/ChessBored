class Group < ActiveRecord::Base
  has_many :players, :games
end
