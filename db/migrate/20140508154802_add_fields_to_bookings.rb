class AddFieldsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :from, :text
    add_column :bookings, :to, :text
    add_column :bookings, :date, :date
    add_column :bookings, :date_back, :date
  end
end
