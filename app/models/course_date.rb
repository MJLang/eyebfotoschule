class CourseDate < ActiveRecord::Base
  belongs_to :course

  scope :active, -> { where(:deleted => false) }
  def to_de_s
    "#{start_date.strftime("%d/%m/%y")} - #{end_date.strftime("%d/%m/%y")}"
  end

  def delete
    self.update(:deleted => true)
  end
end
