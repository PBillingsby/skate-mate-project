class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :spot
      t.float :rating
      t.integer :rating_count
    end
  end
end
