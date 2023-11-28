class Favorite < ApplicationRecord
  belongs_to :user
  serialize :genre, Array
  serialize :notgenre, Array
  serialize :buntai, Array
end
