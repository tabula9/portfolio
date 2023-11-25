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
    @favorite = Favorite.new(@search_params)
    if @search_params[:registration].eql?("yes")
      @favorite.save
      flash[:notice] = "この検索条件をお気に入り登録しました"
    end
  end

  private

  def novel_search_params
    params.fetch(:search, {}).permit(:word, :notword, :order, :stop, :kaiwaritu_min, :kaiwaritu_max, :registration, :user_id, genre: [], notgenre: [], buntai: [])
  end
end
