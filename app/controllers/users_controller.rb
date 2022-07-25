class UsersController < ApplicationController
  def index
    @users = User.index_all.page(params[:page])
  end

  def likes
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:blog_id)
    @user_favorites = @user.favorites
  end
  
  
end
