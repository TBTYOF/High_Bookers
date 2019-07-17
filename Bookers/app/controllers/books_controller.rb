class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(params[:id])
	end

	def edit
		
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to user_path(current_user.id)
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
