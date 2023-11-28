class RemoveGenreFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :genre, :string
  end
end
