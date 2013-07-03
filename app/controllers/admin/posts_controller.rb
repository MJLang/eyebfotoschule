class Admin::PostsController < Admin::BaseController
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      if params[:preview]
        respond_to do |format| 
          format.js { render :action => 'preview' }
        end
      else
        @post.update(:published => true)
        respond_to do |format|
          format.js { "window.location = '/admin/posts'; "}
        end
      end
    else
      flash[:error] = "Problem"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      if params[:preview]
        respond_to do |format| 
          format.js { render :action => 'preview' }
        end
      else
        @post.update(:published => true)
        respond_to do |format|
          format.js { "window.location = '/admin/posts'; "}
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to admin_posts_path
  end

  private

    def post_params
      params.require(:post).permit!
    end


end
