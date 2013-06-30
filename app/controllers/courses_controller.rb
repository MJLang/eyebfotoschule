class CoursesController < ApplicationController

  def index
    @courses = Course.ready
  end

end
