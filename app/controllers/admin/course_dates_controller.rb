class Admin::CourseDatesController < Admin::NestedController
  layout 'admin'

  def index
    @dates = @parent.dates.all
  end

  def new
    @date = @parent.dates.new
    respond_to do |format|
      format.js
    end
  end


  def create
    @date = @parent.dates.new(date_params)
    if @date.save
      respond_to do |format|
        format.js
        format.html { redirect_to admin_course_course_dates_path(@parent) }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to admin_course_course_dates_path(@parent) }
      end
    end

  end

  def destroy
    @date = CourseDate.find(params[:id])
    @date.delete
    redirect_to admin_course_prices_path(@parent)
  end

  private

  def date_params
    params.require(:course_date).permit!
  end



end