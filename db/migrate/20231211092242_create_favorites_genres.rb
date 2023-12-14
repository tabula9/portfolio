class CreateFavoritesGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites_genres do |t|
      t.integer :favorite_id
      t.string :genre_parameters

      t.timestamps
    end
  end
end
