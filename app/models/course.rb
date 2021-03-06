class Course < ActiveRecord::Base
  include Parseable

  has_many :prices
  has_many :timeframes
  has_many :images, as: :attachable, :class_name => "Asset"
  has_one :tile
  has_many :dates, :class_name => "CourseDate"
  has_many :trainings
  has_many :bookings, through: :trainings

  after_create :create_tile
  before_save :mark_it_down

  scope :ready, -> {where(:ready => true).order('position') }

  def mark_it_down
    text = self.markdown_description || ""
    self.description = self.render_markdown(text)
  end
end
