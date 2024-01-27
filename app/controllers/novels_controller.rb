class NovelsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'
  require "erb"
  include ERB::Util
  before_action :set_params
  include Search
  before_action :encode

  def set_params
    @search_params = novel_search_params
  end

  def search
    @genres = Genre.all
    @orders = Order.all
    @buntais = Buntai.all
    @user = current_user
    @favorite = Favorite.new(novel_favorite_params)
    if @search_params[:registration].eql?("yes")
      if @favorite.save
        current_id = Favorite.last.id
        Array(@search_params[:genre_parameters]).each do |genre|
          FavoritesGenre.create(favorite_id: current_id, genre_parameters: genre)
        end
        Array(@search_params[:notgenre_parameters]).each do |genre|
          FavoritesNotgenre.create(favorite_id: current_id, notgenre_parameters: genre)
        end
        Array(@search_params[:buntai_parameters]).each do |buntai|
          FavoritesBuntai.create(favorite_id: current_id, buntai_parameters: buntai)
        end
        flash[:notice] = "この検索条件をお気に入り登録しました"
      else
        flash.now[:notice] = "お気に入り登録に失敗しました"
      end
    end
  end

  private

  def novel_search_params
    params.fetch(:search, {}).permit(:word, :notword, :order_parameters, :stop, :min_firstup, :max_firstup, :kaiwaritu_min, :kaiwaritu_max, :registration, :user_id, genre_parameters: [], notgenre_parameters: [], buntai_parameters: [])
  end

  def novel_favorite_params
    params.fetch(:search, {}).permit(:word, :notword, :order_parameters, :stop, :min_firstup, :max_firstup, :kaiwaritu_min, :kaiwaritu_max, :user_id)
  end
end
