class UsersController < ApplicationController
  def show
    @user = current_user
    @favorites = Favorite.all
  end
end
