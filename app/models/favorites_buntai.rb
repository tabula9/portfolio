class FavoritesBuntai < ApplicationRecord
  belongs_to :favorite
  belongs_to :buntai, primary_key: 'parameters', foreign_key: 'buntai_parameters'
end
