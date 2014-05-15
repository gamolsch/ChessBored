class PlayerGame < ActiveRecord::Base
  belongs_to :game, :player
end
