class NotGenre < ApplicationRecord
  has_many :favorites_notgenres, primary_key: 'parameters', foreign_key: 'notgenre_parameters'
  has_many :favorites, through: :favorites_notgenres
end
