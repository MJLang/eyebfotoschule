class AddDeletedToDates < ActiveRecord::Migration
  def change
    add_column :course_dates, :deleted, :boolean, :default => false
  end
end
