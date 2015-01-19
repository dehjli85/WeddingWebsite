class ChangeConfirmationCodeType < ActiveRecord::Migration
  def change
  	change_column :rsvps, :confirmation_code, :string
  end
end
