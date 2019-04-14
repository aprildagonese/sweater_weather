class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :location

      t.timestamps
    end
  end
end
