class Rsvp < ActiveRecord::Base

	validates :first_name, :presence => true
	validates :last_name, :presence => true
    validates :confirmation_code, :presence => true

    #def new(param)

    #end

end
