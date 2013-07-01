class AddPersonsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :persons, :integer
  end
end
