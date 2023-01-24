class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
    if user_signed_in?
      @comment = current_user.comments.new
    end
  end

  private
    def post_params
      params.require(:post).permit(%i[title content tags_id: []])
    end
    
end
