class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorites_genres
  has_many :genres, through: :favorites_genres
end
