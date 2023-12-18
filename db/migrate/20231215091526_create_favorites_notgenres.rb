class CreateFavoritesNotgenres < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites_notgenres do |t|
      t.integer :favorite_id
      t.string :notgenre_parameters

      t.timestamps
    end
  end
end
