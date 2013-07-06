class Admin::BookingsController < Admin::BaseController 

  def index
    @bookings = Booking.order('created_at')
  end

  def get_summary
    @booking = Booking.find(params[:id])
    pdf = @booking.generate_booking_pdf(@booking.name.parameterize)
    send_file("#{@booking.name.parameterize}.pdf")
  end

end