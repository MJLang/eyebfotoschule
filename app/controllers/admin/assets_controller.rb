class Admin::AssetsController < Admin::NestedController
  layout 'admin'
  def index
    @assets = @parent.images
  end

  def create
    @asset = @parent.images.new(asset_params)
    if @asset.save
      flash[:notice] = "Bild hochgeladen"
      redirect_to admin_course_assets_path(@parent)
    else
      flash[:error] = "Da ging was schief"
      redirect_to admin_course_assets_path(@parent)
    end
  end

  def destroy 
    @asset = Asset.find(params[:id])
    @asset.delete
    redirect_to admin_course_assets_path(@parent)
  end

  private

    def asset_params
      params.require(:asset).permit!
    end

end