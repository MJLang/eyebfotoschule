class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      respond_to do |format|
        format.js
        format.html do
          flash[:notice] = "Kurs gebucht"
          redirect_to courses_path
        end
      end
    else 
      respond_to do |format|
        format.js
        format.html do
          flash[:error] = "Problem mit der Buchung"
          redirect_to courses_path
        end
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit!
  end

end
