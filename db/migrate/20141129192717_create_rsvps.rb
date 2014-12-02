class CreateRsvps < ActiveRecord::Migration
	def change
		create_table :rsvps do |t|
			t.string :first_name
			t.string :last_name
			t.integer :confirmation_code
			t.string :meal_choice
			t.boolean :attending?
			t.timestamps
		end
	end
end
