class Admin::CoursesController < Admin::BaseController
  layout 'admin'
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Kurs erfolgreich gespeichert"
      redirect_to admin_course_path(@course)
    else
      flash[:error] = "Fehler gefunden"
      render :new
    end
  end

  def edit
  end

  def destroy
    @course = Course.find(params[:id])
    @course.delete
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :markdown_description)
  end

end
