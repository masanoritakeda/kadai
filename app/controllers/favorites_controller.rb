class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.create(user_id: current_user.id, blog_id: @blog.id)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy 
    @blog = Blog.find(params[:blog_id])
    favorite = Favorite.find_by(user_id: current_user.id, blog_id: @blog.id)
    favorite.destroy
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end 
end
