class CreateBuntais < ActiveRecord::Migration[6.1]
  def change
    create_table :buntais do |t|
      t.string :name
      t.string :parameters

      t.timestamps
    end
  end
end
