class Groups < ActiveRecord::Base
  has_many :players, :games
end
