class EntriesController < ApplicationController

	# Entry.all looks at the model, which will then locate where in the database you are looking at
	
	def index
		@entries = Entry.all
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.create(entry_params)
		redirect_to @entry
	end

	def show
		@entry = Entry.find_by(id: params[:id])

		@user = User.find_by(id: session[:user_id])

    	if @user
    		render :show
    	else
    		redirect_to '/login'
    	end
	end

	def destroy
		@entry = Entry.find_by(id: params[:id])
		@entry.destroy

		redirect_to entries_path
	end

	def edit
		@entry = Entry.find_by(id: params[:id])
	end

	def update
		@entry = Entry.find_by(id: params[:id])
		@entry.update_attributes(entry_params)

		redirect_to @entry
	end

	private
	def entry_params
		params.require(:entry).permit(:title, :author, :content)
	end
end

