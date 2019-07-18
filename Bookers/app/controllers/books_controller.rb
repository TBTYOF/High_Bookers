class BooksController < ApplicationController
	def index
		@books = Book.all
		@new_book = Book.new
		@signin_user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@new_book = Book.new
		@signin_user = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end
	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book)
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
