class RsvpSet 
	include ActiveRecord::Validations	
	attr_accessor :rsvps


	validate :all_rsvps_okay

	def all_rsvps_okay
    	rsvps.each do |rsvp|
    		rsvp.errors.each do |attribute, error|
    			errors.add :rsvps, attribute.to_s + ': ' + error
    		end      		
    	end

    	return errors.empty?
	end 

    def save
    	rsvps.each do |rsvp|
    		puts rsvp.id
    		rsvp.update_attributes(rsvp.attributes)
    	end
  	end

  	def rsvps=(rsvp_array)  		
  		@rsvps = Array.new
    	rsvp_array.each do |rsvp|    		
        		@rsvps << rsvp  		
    	end
  	end

  	def rsvps
     # your rsvp-find logic here
    	@rsvps || Rsvp.all
  	end

  	def initialize(attributes = {})
    	@attributes = attributes
  	end

end
