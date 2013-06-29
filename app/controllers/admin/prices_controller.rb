class Admin::PricesController < Admin::NestedController
  layout 'admin'

  def index
    @prices = @parent.prices.all
  end

  def new
    @price = @parent.prices.new
    respond_to do |format|
      format.js
    end
  end


  def create
    @price = @parent.prices.new(price_params)
    if @price.save
      respond_to do |format|
        format.js
        format.html { redirect_to admin_course_prices_path(@parent) }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to admin_course_prices_path(@parent) }
      end
    end

  end

  def destroy
    @price = Price.find(params[:id])
    @price.delete
    redirect_to admin_course_prices_path(@parent)
  end

  private

  def price_params
    params.require(:price).permit!
  end



end