class SessionsController < ApplicationController
	def index
		@player = Player.new
	end

	def register
		password = params[:player][:password_hash]
		player = Player.new(register_params)
		player.password = password
		player.save!
		session[:player_id] = player.id
		redirect_to :profile
	end

	def login
		session[:player_id] = Player.authenticate(login_params)
		puts "*"*50
		p session[:player_id]
		if session[:player_id] != nil
			redirect_to :profile
		else
			redirect_to '/'
		end
	end

	private #because of strong params Rails 4

	def register_params
  	params.require(:player).permit(:email)
	end

	def login_params
		params.require(:player).permit(:email, :password_hash)
	end
end
