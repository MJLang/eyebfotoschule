class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :markdown_body
      t.text :body
      t.boolean :published, default: false
      t.string :authored_by

      t.timestamps
    end
  end
end
