class AddReadyToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :ready, :boolean, :default => false
  end
end
