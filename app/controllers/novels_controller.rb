class NovelsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'
  require "erb"
  include ERB::Util

  def search
    narou_api = 'https://api.syosetu.com/novelapi/api/?out=json&'
    @search_params = novel_search_params
    if @search_params[:word].present?
      narou_api += "word=#{url_encode(@search_params[:word])}&"
    end
    if @search_params[:notword].present?
      narou_api += "notword=#{url_encode(@search_params[:notword])}&"
    end
    genre_or = Array(@search_params[:genre]).join('-')
    notgenre_or = Array(@search_params[:notgenre]).join('-')
    buntai_or = Array(@search_params[:buntai]).join('-')
    kaiwaritu = Array(@search_params[:kaiwaritu_min]).concat(Array(@search_params[:kaiwaritu_max])).uniq.join('-')
    request = URI.encode_www_form({ order: @search_params[:order], stop: @search_params[:stop], kaiwaritu: kaiwaritu, genre: genre_or, notgenre: notgenre_or, buntai: buntai_or })
    narou_api += request
    @api = narou_api
    uri = URI.parse(narou_api)
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
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
