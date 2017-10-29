class VotesController < ApplicationController
	before_action :authenticate_user!
	def create
		@type = params[:votable_type]
		@votable = @type.constantize.find_by id: params[:votable_id]

		unless @votable
			flash[:danger] = @type + " not found"
      redirect_to root_path
		end
		@votable.liked_by current_user

		if @type.eql? "Review"
			@object = Book.find_by id: @votable.book_id
		else
			@object = @votable
		end
		respond_to do |format|
      format.html {redirect_to @object}
      format.js
    end
	end

	def destroy
		like = Vote.find_by id: params[:id]
		@type = params[:votable_type]

		if like
			if current_user.id == like.voter_id
				@votable = @type.constantize.find_by id: like.votable_id
				@votable.unliked_by current_user
				if @type.eql? "Review"
					@object = Book.find_by id: @votable.book_id
				else
					@object = @votable
				end
				respond_to do |format|
		      format.html {redirect_to @object}
		      format.js
		    end
			else
				flash[:danger] = "You are not allowed to perform this action."
      	redirect_to root_path
			end
		else
			flash[:danger] = "This like or follow does not exist."
      redirect_to root_path
		end
	end
end
