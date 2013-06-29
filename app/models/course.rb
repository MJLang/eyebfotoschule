class Course < ActiveRecord::Base
  include Parseable

  has_many :prices
  has_many :timeframes
  has_many :images, as: :attachable, :class_name => "Asset"
  has_one :tile

  after_create :create_tile
  before_save :mark_it_down

  def mark_it_down
    text = self.markdown_description || ""
    self.description = self.render_markdown(text)
  end
end
