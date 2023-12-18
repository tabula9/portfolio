class CreateFavoritesBuntais < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites_buntais do |t|
      t.integer :favorite_id
      t.string :buntai_parameters

      t.timestamps
    end
  end
end
