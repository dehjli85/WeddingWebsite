class ChangeAttendingColumnName < ActiveRecord::Migration
  def change
  	rename_column('rsvps', 'attending?','attending')
  end
end
