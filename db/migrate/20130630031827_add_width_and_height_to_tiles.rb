class AddWidthAndHeightToTiles < ActiveRecord::Migration
  def change
    add_column :tiles, :width, :integer, :default => 1
    add_column :tiles, :height, :integer, :default => 1
  end
end
