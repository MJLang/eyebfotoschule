class CreateCourseDates < ActiveRecord::Migration
  def change
    create_table :course_dates do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :course, index: true

      t.timestamps
    end
  end
end
