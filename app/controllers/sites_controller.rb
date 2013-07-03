class SitesController < ApplicationController
  def home
    @posts = Post.published.order('created_at DESC')
  end

  def about
  end

  def contact
    @message = Message.new
  end
end
