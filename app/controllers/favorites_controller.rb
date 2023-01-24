class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post_favorite = current_user.favorites.create(post_id: params[:post_id])
    @post_favorite.save
    redirect_back(fallback_location: @post)
  end

  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_back(fallback_location: @post)
  end
end
