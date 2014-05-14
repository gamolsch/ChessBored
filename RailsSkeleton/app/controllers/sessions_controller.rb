class SessionsController < ApplicationController
	def index
		@user = User.new
	end

	def register
		password = params[:user][:password_hash]
		user = User.new(register_params)
		user.password = password
		user.save!
		session[:user_id] = user.id
		redirect_to :profile
	end

	def login
		session[:user_id] = User.authenticate(login_params)
		puts "*"*50
		p session[:user_id]
		if session[:user_id] != nil
			redirect_to :profile
		else
			redirect_to '/'
		end
	end

	private #because of strong params Rails 4
	
	def register_params
  	params.require(:user).permit(:email)
	end

	def login_params
		params.require(:user).permit(:email, :password_hash)
	end
end