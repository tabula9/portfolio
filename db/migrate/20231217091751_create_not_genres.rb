class CreateNotGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :not_genres do |t|
      t.string :name
      t.string :parameters

      t.timestamps
    end
  end
end
