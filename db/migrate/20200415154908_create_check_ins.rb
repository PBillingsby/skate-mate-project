class CreateCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :check_ins do |t|
      t.integer :user_id
      t.integer :location_id
    end
  end
end
