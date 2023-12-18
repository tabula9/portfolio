class FavoritesNotgenre < ApplicationRecord
  belongs_to :favorite
  belongs_to :not_genre, primary_key: 'parameters', foreign_key: 'notgenre_parameters'
end
