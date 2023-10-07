class NovelsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'

  def search
    narou_api = 'https://api.syosetu.com/novelapi/api/?out=json&'
    if params[:genre].present?
      genres = params[:genre].join('-')
      request = URI.encode_www_form({ word: params[:word], order: params[:order], genre: genres })
    elsif params[:word].present?
      request = URI.encode_www_form({ word: params[:word], order: params[:order] })
    else
      request = URI.encode_www_form(order: params[:order])
    end
    narou_api += request
    @api = narou_api
    uri = URI.parse(narou_api)
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
  end
end
