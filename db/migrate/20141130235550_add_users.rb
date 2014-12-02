class AddUsers < ActiveRecord::Migration
	def change
		u = User.new	
		u.email = 'dennis.hj.li@gmail.com'
		u.password = 'adv14524'
		u.save

		w = User.new
		w.email = 'katiejwang@gmail.com'
		w.password = 'ramekins'
		w.save
	end
end
