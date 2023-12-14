class Genre < ApplicationRecord
  has_many :favorites_genres, primary_key: 'parameters', foreign_key: 'genre_parameters'
  has_many :favorites, through: :favorites_genres
end
