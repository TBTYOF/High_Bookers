class BooksController < ApplicationController
	def index
		@books = Book.all
		@book = Book.new
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
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book), notice: 'You have updated book successfully'
		else
			render :edit, book: @book
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book), notice: 'You have creatad book successfully.'
		else
			@books = Book.all
			@signin_user = current_user
			@new_book = Book.new
			render 'books/index', signin_user: @signin_user, new_book: @new_book, books: @books
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
