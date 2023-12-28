class ChangeDataStopToFavorites < ActiveRecord::Migration[6.1]
  def up
    remove_column :favorites, :registration
    change_column :favorites, :stop, :boolean
  end

  def down
    change_column :favorites, :stop, :string
  end
end
