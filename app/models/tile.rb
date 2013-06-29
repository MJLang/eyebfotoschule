class Tile < ActiveRecord::Base
  belongs_to :course

  before_create :set_defaults

  def set_defaults
    self.title = self.course.name
    self.subtitle = ""
    self.image_id = self.course.images.preview.first.id
    self.format = 'one-by-one'
  end

end
