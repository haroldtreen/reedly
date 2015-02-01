class BooksController < ApplicationController
	def index
		render json: Book.all
	end

	def create
		Book.create(book_params)
	end

	def publish
		book = Book.find(params[:id])
		PublishService.send_to_kindle(book)
	end

	private 

	def book_params
		params.require(:title).permit(:links, :description)
	end
end
