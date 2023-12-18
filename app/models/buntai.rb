class Buntai < ApplicationRecord
  has_many :favorites_buntais, primary_key: 'parameters', foreign_key: 'buntai_parameters'
  has_many :favorites, through: :favorites_buntais
end
