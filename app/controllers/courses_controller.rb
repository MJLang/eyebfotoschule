class CoursesController < ApplicationController

  def index
    @courses = Course.ready.all
  end

end
