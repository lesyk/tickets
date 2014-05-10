class RenameTitleToPrice < ActiveRecord::Migration
  def change
    rename_column(:bookings, :price, :price)
  end
end
