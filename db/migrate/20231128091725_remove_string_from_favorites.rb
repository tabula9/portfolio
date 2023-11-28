class RemoveStringFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :notgenre, :string
    remove_column :favorites, :buntai, :string
  end
end
