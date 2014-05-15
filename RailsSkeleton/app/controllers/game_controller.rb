class GameController < ApplicationController
  def dashboard
  	unless session[:player_id]
  		redirect_to root_url
  	end
  end

  def game
  end
end
