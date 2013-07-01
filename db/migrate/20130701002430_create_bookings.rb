class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :notes

      t.timestamps
    end
  end
end
