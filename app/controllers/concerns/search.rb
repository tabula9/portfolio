module Search
  extend ActiveSupport::Concern

  def encode
    narou_api = 'https://api.syosetu.com/novelapi/api/?out=json&'
    if @search_params[:word].present?
      narou_api += "word=#{url_encode(@search_params[:word])}&"
    end
    if @search_params[:notword].present?
      narou_api += "notword=#{url_encode(@search_params[:notword])}&"
    end
    genre_or = Array(@search_params[:genre_parameters]).join('-')
    notgenre_or = Array(@search_params[:notgenre_parameters]).join('-')
    buntai_or = Array(@search_params[:buntai_parameters]).join('-')
    kaiwaritu = Array(@search_params[:kaiwaritu_min]).concat(Array(@search_params[:kaiwaritu_max])).uniq.join('-')
    request = URI.encode_www_form({ order: @search_params[:order], stop: @search_params[:stop], kaiwaritu: kaiwaritu, genre: genre_or, notgenre: notgenre_or, buntai: buntai_or })
    narou_api += request
    @api = narou_api
    uri = URI.parse(narou_api)
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
  end
end
