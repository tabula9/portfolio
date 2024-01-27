class AddFirstupToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :min_firstup, :date
    add_column :favorites, :max_firstup, :date
  end
end
