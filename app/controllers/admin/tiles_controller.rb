class Admin::TilesController < Admin::NestedController

  layout 'admin'


  def edit
    @tile = @parent.tile
  end

  def update
    @tile = @parent.tile
    @tile.update(tile_params)
    redirect_to edit_admin_course_tile_path(@tile.course)
  end

  private

  def tile_params
    params.require(:tile).permit!
  end


end