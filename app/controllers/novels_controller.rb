class NovelsController < ApplicationController
  require 'net/http'
  require 'json'
  require 'uri'

  def search
    uri = URI.parse('https://api.syosetu.com/novelapi/api/?out=json&ncode=n0001a-n1111b-n9999d')
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
  end
end
