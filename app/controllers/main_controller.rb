class MainController < ApplicationController

	skip_before_action :require_login
	skip_before_action :unlock_site, only: [:unlock, :unlock_post]

	def index

		
	end
	
	def the_big_day
		
	end

	def our_story

		
	end 

	def photos


		
	end

	def wedding_party

		
	end

	def lodging

		
	end

	def faqs

		
	end

	def registry

		
	end

	def rsvp
		flash[:notice] = nil
	end

	def unlock

	end

	def unlock_post
		if(params[:password].eql?('basil0213'))
			session[:unlocked] = true
			redirect_to '/'
		else
			render 'unlock'
		end
	end
end
