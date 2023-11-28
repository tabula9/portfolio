class AddArrayToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :notgenre, :text
    add_column :favorites, :buntai, :text
  end
end
