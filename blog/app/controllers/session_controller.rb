class SessionController < ApplicationController
	def new
		render :new
	end

	def create
		binding.pry
		# this is used for bcrypt. More secure than sessions
		user = User.find_by(username: params[:username])
		binding.pry
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/secret'
		else
			@error = true
			render :new
		end
	end

	def destroy
		# reset_session will kill the existing session
		reset_session
		redirect_to '/login'
	end

end