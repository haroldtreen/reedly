class BooksController < ApplicationController
	skip_before_filter :verify_authenticity_token 

	def index
		render json: Book.all
	end

	def create
		book = Book.create(title: book_params[:title], links: book_params[:links].join(";"), user_id: User.last.id)
		render json: book
	end

	def publish
		book = Book.find(params[:id])
		Reedler.to_epub(book)
		PublishService.send_to_kindle(book)
	end

	private 

	def book_params
		params.require(:book).permit(:title, { links: [] }, :description)
	end
end
