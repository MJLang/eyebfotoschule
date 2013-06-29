class Admin::TimeframesController < Admin::NestedController
  layout 'admin'

  def index
    @timeframes = @parent.timeframes.all
  end

  def new
    @timeframe = @parent.timeframes.new
    respond_to do |format|
      format.js
    end
  end


  def create
    @timeframe = @parent.timeframes.new(tf_params)
    if @timeframe.save
      respond_to do |format|
        format.js
        format.html { redirect_to admin_course_timeframes_path(@parent) }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to admin_course_timeframes_path(@parent) }
      end
    end

  end

  def destroy
    @timeframe = Timeframe.find(params[:id])
    @timeframe.delete
    redirect_to admin_course_timeframes_path(@parent)
  end

  private

  def tf_params
    params[:timeframe].parse_time_select! :starts_at
    params[:timeframe].parse_time_select! :ends_at
    params.require(:timeframe).permit!
  end



end