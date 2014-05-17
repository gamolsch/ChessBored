class GameController < ApplicationController
  def game
    #unless session[:player_id]
      redirect_to root_url
    #end
  end

  def get_piece_info
  	puts "THESE ARE PIECE PARAMS"
  	p params
  	return "hello?" 
  end

end
