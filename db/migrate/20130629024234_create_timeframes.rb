class CreateTimeframes < ActiveRecord::Migration
  def change
    create_table :timeframes do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :days
      t.string :description
      t.references :course, index: true

      t.timestamps
    end
  end
end
