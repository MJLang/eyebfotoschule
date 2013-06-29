module Parseable
  extend ActiveSupport::Concern

  def render_markdown(text)
    renderer = Redcarpet::Render::HTML.new(renderer_attributes)
    markdown = Redcarpet::Markdown.new(renderer, render_attributes)
    output = markdown.render(text)
  end

  def render_attributes
    {
      :autlink => true
    }
  end

  def renderer_attributes
  {
    :filter_html => true,
    :no_styles => true,
    :hard_wrap => true
  }
  end
  
end