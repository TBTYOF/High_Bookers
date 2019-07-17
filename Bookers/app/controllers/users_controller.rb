class UsersController < ApplicationController
	def top
	end
	def about
	end

	def show
		@user = current_user.id
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image_id)
	end
end
