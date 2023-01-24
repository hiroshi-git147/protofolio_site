class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_back(fallback_location: @post)
  end
  
  def edit
  end

  def update
    if @comment.update(comment_params)
      @comment.updated_at = Time.now
      @comment.update!(comment_params)
      redirect_back(fallback_location: @post)
    else
      redirect_back(fallback_location: @post)
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: @post)
  end

  private
  def comment_params
    params.require(:comment).permit(%i[comment_content post_id user_id]) 
  end
end
