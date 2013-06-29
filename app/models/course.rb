class Course < ActiveRecord::Base
  include Parseable

  has_many :prices
  has_many :timeframes
  has_many :images, as: :attachable, :class_name => "Asset"

  before_save :mark_it_down

  def mark_it_down
    self.description = self.render_markdown(self.markdown_description)
  end
end
