class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	#before_action :unlock_site

	#before_action :require_login

	def require_login
		@current_user = (!session[:id].nil? && User.exists?(session[:id])) ? User.find(session[:id]) : nil
		unless !@current_user.nil?
			redirect_to '/login'
		end
	end

	def unlock_site
		unless session[:unlocked]
			redirect_to '/unlock'
		end
	end

end
