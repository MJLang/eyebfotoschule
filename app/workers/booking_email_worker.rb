class BookingEmailWorker
  include Sidekiq::Worker

  def perform(email, booking_id)
    @booking = Booking.find(booking_id)
  end
end
