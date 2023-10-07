class NovelsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'

  def search
    narou_api = 'https://api.syosetu.com/novelapi/api/?out=json&'
    @search_params = novel_search_params
    if @search_params[:genre].present?
      genres = @search_params[:genre].join('-')
      request = URI.encode_www_form({ word: @search_params[:word], order: @search_params[:order], genre: genres })
    else
      request = URI.encode_www_form({ word: @search_params[:word], order: @search_params[:order] })
    end
    narou_api += request
    @api = narou_api
    uri = URI.parse(narou_api)
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
  end

  private

  def novel_search_params
    params.fetch(:search, {}).permit(:word, :order, genre: [])
  end
end
