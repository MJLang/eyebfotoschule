class AddPositionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :position, :integer

    Course.all.each_with_index do |c, i|
      c.update_attribute(:position, i+1)
    end

  end
end
