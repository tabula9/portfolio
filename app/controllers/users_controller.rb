class UsersController < ApplicationController
  def show
    @user = current_user
    @favorites = @user.favorites
  end
end
