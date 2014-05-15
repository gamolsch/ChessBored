class GameController < ApplicationController
  def game
        unless session[:player_id]
      redirect_to root_url
    end
  end
end
