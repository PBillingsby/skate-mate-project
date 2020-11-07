class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :rating
      t.integer :location_id
      t.integer :user_id
    end
  end
end
