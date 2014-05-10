class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :price
      t.string :code

      t.timestamps
    end
  end
end
