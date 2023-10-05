class NovelsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'

  def search
    narou_api = 'https://api.syosetu.com/novelapi/api/?out=json&'
    if params[:word].present?
      word = URI.encode_www_form(word: params[:word])
      narou_api += word
    end
    if params[:genre].present?
      genres = params[:genre].join('-')
      genre = URI.encode_www_form(genre: genres)
      narou_api += genre
    end
    order = URI.encode_www_form(order: params[:order])
    narou_api += order
    uri = URI.parse(narou_api)
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
  end
end
