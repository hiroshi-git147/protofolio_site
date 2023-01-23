class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]
  
  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  
  def show
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path, notice: 'Post was successfully created.'
    else
      redirect_to new_admin_post_path
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      @post.updated_at = Time.now
      @post.update!(post_params)
      redirect_to admin_posts_path, notice: 'Post was successfully updated.'
    else
      redirect_to edit_admin_post_path
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(%i[title content tags_id: []])
  end
end
