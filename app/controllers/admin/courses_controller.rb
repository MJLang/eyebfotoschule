class Admin::CoursesController < Admin::BaseController
  layout 'admin'
  
  def index
    @courses = Course.order('position')
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
    @course = Course.find(params[:id])
  end

  def update

    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to admin_course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.delete
    redirect_to admin_courses_path
  end

  def sort
    params[:course].each_with_index do |c, i|
      Course.update_all({position: i+1}, {id: c})
    end
    render nothing: true
  end

  private

  def course_params
    params.require(:course).permit(:name, :markdown_description, :ready)
  end

end
