class UsersController < ApplicationController
  def index
    @users = User.index_all.page(params[:page])
  end
end
