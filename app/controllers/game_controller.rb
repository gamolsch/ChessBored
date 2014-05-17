class GameController < ApplicationController
  def index
    unless session[:player_id]
      redirect_to root_url
    end
    render :game
  end

  def game
    render :game
  end


  def get_piece_info
  	puts "THESE ARE PIECE PARAMS"
    piece = Piece.new(color: params[:piece_color], location: params[:piece_location], piece_type: params[:piece_type], is_dead: false, is_first_move: false)
    moves = piece.get_piece_logic
    render :json => [moves]
  end

end
