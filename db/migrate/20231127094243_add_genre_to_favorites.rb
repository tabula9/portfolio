class AddGenreToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :genre, :text
  end
end
