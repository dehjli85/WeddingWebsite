class Rsvp < ActiveRecord::Base

	validates :first_name, :presence => true
	validates :last_name, :presence => true
    #validates :confirmation_code, :presence => true

    default_scope { order(:last_name => :asc, :first_name=> :asc, ) } 

    #def new(param)

    #end

end
