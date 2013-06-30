class Tile < ActiveRecord::Base
  belongs_to :course

  before_create :set_defaults
  before_save :change_dimensions

  def set_defaults
    self.title = self.course.name
    self.subtitle = ""
    self.image_id = self.course.images.preview.first.try(:id)
    self.format = 'one_by_one'
    self.width = 1
    self.height = 1  
  end

  def image
    Asset.find(self.image_id) if self.image_id && Asset.exists?(self.image_id)
  end

  def change_dimensions
    return true if self.new_record?
    case self.format
      when "one_by_one"
        self.width = 1
        self.height = 1
      when "two_by_two"
        self.width = 1
        self.height = 1
      when "one_by_two"
        self.width = 1
        self.height = 2
      when "two_by_one"
        self.width = 2
        self.height = 1
      else
        self.width = 1
        self.height = 1
      end
    end


end
