module ApplicationHelper

  def title(page)
    content_for(:title) { page }
  end

end
