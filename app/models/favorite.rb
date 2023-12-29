class Favorite < ApplicationRecord
  belongs_to :user
  has_many :favorites_genres, dependent: :destroy
  has_many :genres, through: :favorites_genres
  has_many :favorites_notgenres, dependent: :destroy
  has_many :not_genres, through: :favorites_notgenres
  has_many :favorites_buntais, dependent: :destroy
  has_many :buntais, through: :favorites_buntais
  belongs_to :order, primary_key: 'parameters', foreign_key: 'order_parameters'
end
