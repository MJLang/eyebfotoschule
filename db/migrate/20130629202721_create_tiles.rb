class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :title
      t.string :subtitle
      t.integer :image_id
      t.string :format
      t.references :course, index: true

      t.timestamps
    end
  end
end
