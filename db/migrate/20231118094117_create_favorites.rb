class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :word
      t.string :notword
      t.string :order
      t.string :stop
      t.integer :kaiwaritu_min
      t.integer :kaiwaritu_max
      t.string :genre
      t.string :notgenre
      t.string :buntai

      t.timestamps
    end
  end
end
