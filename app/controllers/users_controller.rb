class UsersController < ApplicationController
  def index
    @user = current_user
    @favorites = @user.favorites
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash[:notice] = "お気に入りを削除しました"
    redirect_to users_path
  end
end
