class AddRegistrationToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :registration, :string
  end
end
