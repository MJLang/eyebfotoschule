class Training < ActiveRecord::Base
  belongs_to :course
  belongs_to :booking
  belongs_to :timeframe
  belongs_to :course_date
  belongs_to :price
end
