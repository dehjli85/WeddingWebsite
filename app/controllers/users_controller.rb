class UsersController < ApplicationController

	skip_before_action :require_login, only: [:login, :post_login]

	def index
		@users = User.all
	end

	def login
		
		@user = (!session[:id].nil? && !User.find(session[:id]).nil?) ? User.find(session[:id]) : User.new
	end

	def post_login
		
		@user = (!params[:user].nil? && !params[:user][:email].nil?) ? User.find_by_email(params[:user][:email]) : nil
		
		if !@user.nil? && @user.password_valid?(params[:user][:password])
			session[:id] = @user.id
			redirect_to('/rsvp/viewAllRsvp')
		else
			reset_session
			flash[:error] = "Invalid Login Credentials"
			render "login"

		end
	end

	def logout
		reset_session
		redirect_to(:controller => "users", :action=>"login")
	end

=begin
	def new
		reset_session			
	end

	def create
		@user = User.new(params[:user])		

		if @user.save
			flash[:notice] = "New Account Successfully Created"
			redirect_to(:controller => "users", :action=>"login")
		else
			render "/users/new"

		end
	end
=end
end
