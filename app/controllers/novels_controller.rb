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
    genre_or = Array(@search_params[:genre]).join('-')
    buntai_or = Array(@search_params[:buntai]).join('-')
    kaiwaritu = Array(@search_params[:kaiwaritu_min]).concat(Array(@search_params[:kaiwaritu_max])).uniq.join('-')
    request = URI.encode_www_form({ order: @search_params[:order], stop: @search_params[:stop], kaiwaritu: kaiwaritu, genre: genre_or, buntai: buntai_or })
    narou_api += request
    @api = narou_api
    uri = URI.parse(narou_api)
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
    @genres = Genre.all
    @orders = Order.all
    @buntais = Buntai.all
  end

  private

  def novel_search_params
    params.fetch(:search, {}).permit(:word, :order, :stop, :kaiwaritu_min, :kaiwaritu_max, genre: [], buntai: [])
  end
end
