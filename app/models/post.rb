class Post < ActiveRecord::Base
  include Parseable

  scope :published, -> { where(:published => true) }

  before_save :mark_it_down

    def mark_it_down
      text = self.markdown_body || ""
      self.body = self.render_markdown(text)
    end
end
