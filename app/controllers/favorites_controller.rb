class FavoritesController < ApplicationController

  	def create
  		favorite = Favorite.new
  		book = Book.find(params[:book_id])
  		favorite.user_id = current_user.id
  		favorite.book_id = book.id
  		favorite.save
  		redirect_to request.referer
	end

  	def destroy
  		book = Book.find(params[:book_id])
  		favorite = current_user.favorites.find_by(book_id: book.id)
  		favorite.destroy
  		redirect_to request.referer
	end


end
