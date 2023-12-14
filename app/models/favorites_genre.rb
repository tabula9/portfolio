class FavoritesGenre < ApplicationRecord
  belongs_to :favorite
  belongs_to :genre, primary_key: 'parameters', foreign_key: 'genre_parameters'
end
