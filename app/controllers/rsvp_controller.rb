class RsvpController < ApplicationController

	require 'rsvpSet.rb'

	skip_before_action :require_login, only: [:edit, :save, :saveSubmit]

	def edit

		flash[:notice] = nil
			
		#Query database for last name and confirmation code
		#If Matched Get all RSVPs with the same confirmation code, show edit page
		rsvp = params[:rsvp]
		
		if !Rsvp.where(:last_name => rsvp[:last_name], :confirmation_code=>rsvp[:confirmation_code]).empty?

			@rsvpSet = RsvpSet.new
			@rsvpSet.rsvps = Rsvp.where(:confirmation_code => rsvp[:confirmation_code]).to_a

		#If no match, return to the search page with error
		else
			flash[:notice] = 'No RSVP match found!'
			render 'main/rsvp'
		end

		

	end

	def save

		#save meal selection and attendance for all entries with the confirmation code
		@rsvpSet = RsvpSet.new		
		array = Array.new

		params[:rsvpSet][:rsvps].each do |k,v|
			if(v[:id])
				target = Rsvp.find(v[:id])
				target.attributes = v
			else
				target = Rsvp.new(v)
			end
			array << target
		end
		
		@rsvpSet.rsvps=array

		flash[:notice] = nil
		if @rsvpSet.all_rsvps_okay
			@rsvpSet.save
			flash[:notice] = 'Successfully Saved!'
			redirect_to '/rsvp/saveSubmit' 
		else
			flash[:notice] = 'Error Saving!'
			render :action => 'edit'
		end


	end

	def saveSubmit

	end

	def viewAllRsvp

		#query database for all RSVPs
		Rsvp.order('confirmation_code asc')
		@rsvps = Rsvp.order(:confirmation_code)

	end

	def editAllRsvp

		@rsvpSet = RsvpSet.new

		puts @rsvpSet
		
	end

	def saveAllRsvp

		@rsvpSet = RsvpSet.new		
		array = Array.new

		params[:rsvpSet][:rsvps].each do |k,v|
			if(v[:id])
				target = Rsvp.find(v[:id])
				target.attributes = v
			else
				target = Rsvp.new(v)
			end
			array << target
		end
		
		@rsvpSet.rsvps=array

		if @rsvpSet.all_rsvps_okay
			@rsvpSet.save
			flash[:notice] = 'Successfully Saved!'
			redirect_to '/rsvp/viewAllRsvp' 
		else
			flash[:notice] = 'Error Saving!'
			render :action => 'editAllRsvp'
		end

	end

	def new

	end

	def saveNewRsvp
		
		puts  params[:inputLastName]

		@rsvp = Rsvp.new
		@rsvp.first_name = params[:inputFirstName]
		@rsvp.last_name = params[:inputLastName]
		@rsvp.confirmation_code = params[:inputConfirmationCode]

		

		if(@rsvp.save)
			flash[:notice] = 'Successfully Saved!'
			redirect_to '/rsvp/new' 
		else
			flash[:notice] = 'Error Saving!'
			render :action => 'newRsvp'
		end
	end


end
