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
  end

  def delete
  end



end