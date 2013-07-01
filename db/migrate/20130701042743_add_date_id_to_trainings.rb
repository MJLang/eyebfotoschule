class AddDateIdToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :course_date_id, :integer, index: true
  end
end
