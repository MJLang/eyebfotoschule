class Admin::AssetsController < Admin::NestedController

  def index
    @images = @parent.images
  end

  def create

  end

  def delete
  end


end