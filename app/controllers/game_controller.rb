class GameController < ApplicationController
  
  def game
    if session[:game_id]
      GameHelper.load(session[:game_id])
    else
      @game = Game.create()
      PlayerGame.create(player_id: session[:player_id], game_id: @game.id) 
      render :game
    end
  end

  def game_id
    session[:game_id] = params[:id]
    redirect_to :game
  end

  def get_piece_info
  	puts "THESE ARE PIECE PARAMS"
    piece = Piece.new(color: params[:piece_color], location: params[:piece_location], piece_type: params[:piece_type], is_dead: false) #is_first_move: false NOTES: need to make update_attributes
    moves = piece.get_piece_logic
    render :json => [moves]
  end

end
