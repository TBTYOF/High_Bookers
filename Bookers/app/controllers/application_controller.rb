class ApplicationController < ActionController::Base
	before_action :authenticate_user!, :except=>[:top, :about]
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :ensure_correct_user, {only:[:edit, :update]}

	def ensure_correct_user
		if current_user.id != params[:id].to_i
			redirect_to books_path
		end
	end

	def after_sign_in_path_for(resource)
  		user_path(current_user.id)
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end
end
