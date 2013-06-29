class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :category
      t.string :description
      t.belongs_to :attachable, polymorphic: true

      t.timestamps
    end
    add_index :assets, [:attachable_id, :attachable_type]
  end
end
