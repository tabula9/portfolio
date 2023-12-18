class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorites_genres
  has_many :genres, through: :favorites_genres
  has_many :favorites_notgenres
  has_many :not_genres, through: :favorites_notgenres
  has_many :favorites_buntais
  has_many :buntais, through: :favorites_buntais
end
