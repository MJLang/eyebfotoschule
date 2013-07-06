class AddNumberToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :number, :string

    bookings = ::Booking.all
    bookings.each do |booking|
      booking.generate_number
      booking.save
    end
  end
end
