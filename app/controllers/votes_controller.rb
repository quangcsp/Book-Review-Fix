class VotesController < ApplicationController
	before_action :authenticate_user!
	def create
		@review = Review.find_by id: params[:review_id]

		unless @review
			flash[:danger] = "Review not found"
      redirect_to root_path
		end
		@review.liked_by current_user
		@book = Book.find_by id: @review.book_id
		respond_to do |format|
      format.html {redirect_to @book}
      format.js
    end
	end

	def destroy
		like = Vote.find_by id: params[:id]

		if like
			if current_user.id == like.voter_id
				@review = Review.find_by id: like.votable_id
				@review.unliked_by current_user
				@book = Book.find_by id: @review.book_id
				respond_to do |format|
		      format.html {redirect_to @book}
		      format.js
		    end
			else
				flash[:danger] = "You are not allowed to perform this action."
      	redirect_to root_path
			end
		else
			flash[:danger] = "This like does not exist."
      redirect_to root_path
		end
	end
end
