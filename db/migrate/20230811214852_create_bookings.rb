class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :end
      t.string :purpose

      t.timestamps
    end
  end
end
