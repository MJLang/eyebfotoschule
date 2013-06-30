class Tile < ActiveRecord::Base
  belongs_to :course

  before_create :set_defaults

  def set_defaults
    self.title = self.course.name
    self.subtitle = ""
    self.image_id = self.course.images.preview.first.try(:id)
    self.format = 'one_by_one'
  end

  def image
    Asset.find(self.image_id)
  end

end
