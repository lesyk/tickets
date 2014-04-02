class AddingUserToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :user_id, :integer
    add_index :bookings, :user_id
  end
end