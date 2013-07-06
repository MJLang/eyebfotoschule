class Training < ActiveRecord::Base
  belongs_to :course
  belongs_to :booking
  belongs_to :timeframe
  belongs_to :course_date
  belongs_to :price

  def date_to_s
    self.date ? self.date.strftime("%d/%m/%Y") : self.course_date.start_date.strftime("%d/%m/%Y")
  end
end
