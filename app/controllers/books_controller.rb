class BooksController < ApplicationController
	def index
		render json: Book.all
	end

	def create
		
	end

	def publish
		book = Book.find(params[:id])
		PublishService.publish(book)
	end
end
