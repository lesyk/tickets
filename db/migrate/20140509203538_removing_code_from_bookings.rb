class RemovingCodeFromBookings < ActiveRecord::Migration
  def change
    remove_column(:bookings, :code)
  end
end
