class UsersController < ApplicationController
	def top
	end
	def about
	end

	def index
		@users = User.all
		@new_book = Book.new
		@signin_user = current_user
	end

	def show
		@user = User.find(params[:id])
		@books = @user.books
		@new_book = Book.new
		@signin_user = current_user
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
		else
			render :edit, user: @user
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end