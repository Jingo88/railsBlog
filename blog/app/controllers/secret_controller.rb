class SecretController < ApplicationController

    def show
    	@user = User.find_by(id: session[:user_id])
    	@entries = Entry.all

    	if @user
    		render :show
    	else
    		redirect_to '/login'
    	end
    end
end
