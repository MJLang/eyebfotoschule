class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :amount
      t.string :description
      t.references :course, index: true

      t.timestamps
    end
  end
end
