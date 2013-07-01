class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.references :course, index: true
      t.references :booking, index: true
      t.references :timeframe, index: true
      t.references :price, index: true

      t.timestamps
    end
  end
end
