class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :rating

      t.timestamps
    end
  end
end
