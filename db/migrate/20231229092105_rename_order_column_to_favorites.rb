class RenameOrderColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    rename_column :favorites, :order, :order_parameters
  end
end
