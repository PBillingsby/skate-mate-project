class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
    end
  end
end
