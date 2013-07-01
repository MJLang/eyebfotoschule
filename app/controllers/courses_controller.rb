class CoursesController < ApplicationController

  def index
    @courses = Course.ready
  end

  def show
    @course = Course.find(params[:id])
    @booking = @course.bookings.new
    @training = @booking.build_training

  end

end
