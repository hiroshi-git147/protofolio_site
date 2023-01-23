class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
    @comment = current_user.comments.new
  end

  private
    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(%i[title content tags_id: []])
    end
    
end
